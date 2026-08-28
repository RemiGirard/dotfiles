-- Hammerspoon config

-- ── Focus Guard ─────────────────────────────────────────────
-- Prevents apps from stealing focus unless triggered by user interaction.
-- Uses a different approach: instead of tracking all input events,
-- we use a short debounce window. If an app activates and the user
-- didn't click or use Cmd+Tab within the last second, refocus the previous app.

local focusGuard = {
  enabled = true,
  protectedWindow = nil,  -- the window we're protecting
  refocusing = false,     -- prevent re-entry during refocus
  allowList = {
    ["1Password"] = true,
    ["Alfred"] = true,
    ["Spotlight"] = true,
    ["Raycast"] = true,
    ["Hammerspoon"] = true,
  },
}

-- Track mouse clicks as intentional focus changes
local clickedRecently = false
local clickTimer = nil

local mouseWatcher = hs.eventtap.new({ hs.eventtap.event.types.leftMouseDown }, function()
  clickedRecently = true
  if clickTimer then clickTimer:stop() end
  clickTimer = hs.timer.doAfter(1.0, function()
    clickedRecently = false
  end)
  return false
end)

-- Track Cmd+Tab as intentional focus change
local cmdTabRecently = false
local cmdTabTimer = nil

local cmdTabWatcher = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
  local flags = event:getFlags()
  local keyCode = event:getKeyCode()
  -- Cmd+Tab or Option+Tab (window switching)
  if keyCode == 48 and (flags.cmd or flags.alt) then
    cmdTabRecently = true
    if cmdTabTimer then cmdTabTimer:stop() end
    cmdTabTimer = hs.timer.doAfter(1.5, function()
      cmdTabRecently = false
    end)
  end
  return false
end)

-- Watch for app activations
local appWatcher = hs.application.watcher.new(function(appName, eventType, appObj)
  if not focusGuard.enabled then return end
  if eventType ~= hs.application.watcher.activated then return end
  if focusGuard.refocusing then return end

  -- Allow listed apps
  if focusGuard.allowList[appName] then return end

  -- If user intentionally switched, update the protected window
  if clickedRecently or cmdTabRecently then
    local win = hs.window.focusedWindow()
    if win then
      focusGuard.protectedWindow = win
    end
    return
  end

  -- No user interaction detected -- this is an uninvited focus steal
  if focusGuard.protectedWindow then
    local app = focusGuard.protectedWindow:application()
    if app and app:isRunning() then
      focusGuard.refocusing = true
      hs.timer.doAfter(0.15, function()
        focusGuard.protectedWindow:focus()
        hs.timer.doAfter(0.1, function()
          focusGuard.refocusing = false
        end)
      end)
      hs.alert.show("Blocked: " .. (appName or "unknown"), 1)
    else
      -- Protected window's app is gone, adopt the new one
      focusGuard.protectedWindow = hs.window.focusedWindow()
    end
  end
end)

-- Toggle focus guard with hotkey: Cmd+Option+F
hs.hotkey.bind({ "cmd", "alt" }, "F", function()
  focusGuard.enabled = not focusGuard.enabled
  local state = focusGuard.enabled and "ON" or "OFF"
  if focusGuard.enabled then
    focusGuard.protectedWindow = hs.window.focusedWindow()
  end
  hs.alert.show("Focus Guard: " .. state, 1.5)
end)

-- Start watchers
mouseWatcher:start()
cmdTabWatcher:start()
appWatcher:start()

-- Set initial protected window
focusGuard.protectedWindow = hs.window.focusedWindow()

-- Auto-reload config on changes
_G.chezmoiConfigWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  hs.reload()
end):start()

-- Screenshot: same physical shortcut as Ctrl+Alt+S on Linux.
-- Select a screen region and copy it directly to the clipboard.
hs.hotkey.bind({ "ctrl", "alt" }, "s", function()
  hs.task.new("/usr/sbin/screencapture", nil, { "-i", "-c" }):start()
end)

-- Capture the full screen and copy it directly to the clipboard.
hs.hotkey.bind({ "ctrl", "alt", "shift" }, "s", function()
  hs.task.new("/usr/sbin/screencapture", nil, { "-c" }):start()
end)

-- ── Compose Key ─────────────────────────────────────────────
-- Right Alt triggers compose mode. Then type a two-key sequence to get an accented character.
-- Same sequences as Linux Compose key. Examples:
--   Right Alt, then ' then e  →  é
--   Right Alt, then ` then a  →  à
--   Right Alt, then ^ then e  →  ê
--   Right Alt, then " then e  →  ë
--   Right Alt, then , then c  →  ç

local compose = {
  active = false,
  firstKey = nil,
  timeout = nil,
  -- Compose sequences: [accent_char][letter] = result
  sequences = {
    -- Acute accent (')
    ["'a"] = "á", ["'A"] = "Á",
    ["'e"] = "é", ["'E"] = "É",
    ["'i"] = "í", ["'I"] = "Í",
    ["'o"] = "ó", ["'O"] = "Ó",
    ["'u"] = "ú", ["'U"] = "Ú",
    -- Grave accent (`)
    ["`a"] = "à", ["`A"] = "À",
    ["`e"] = "è", ["`E"] = "È",
    ["`i"] = "ì", ["`I"] = "Ì",
    ["`o"] = "ò", ["`O"] = "Ò",
    ["`u"] = "ù", ["`U"] = "Ù",
    -- Circumflex (^)
    ["^a"] = "â", ["^A"] = "Â",
    ["^e"] = "ê", ["^E"] = "Ê",
    ["^i"] = "î", ["^I"] = "Î",
    ["^o"] = "ô", ["^O"] = "Ô",
    ["^u"] = "û", ["^U"] = "Û",
    -- Diaeresis/umlaut (")
    ['"a'] = "ä", ['"A'] = "Ä",
    ['"e'] = "ë", ['"E'] = "Ë",
    ['"i'] = "ï", ['"I'] = "Ï",
    ['"o'] = "ö", ['"O'] = "Ö",
    ['"u'] = "ü", ['"U'] = "Ü",
    -- Cedilla (,)
    [",c"] = "ç", [",C"] = "Ç",
    -- Tilde (~)
    ["~n"] = "ñ", ["~N"] = "Ñ",
    ["~a"] = "ã", ["~A"] = "Ã",
    ["~o"] = "õ", ["~O"] = "Õ",
    -- Ligatures and special
    ["oe"] = "œ", ["OE"] = "Œ",
    ["ae"] = "æ", ["AE"] = "Æ",
    ["ss"] = "ß",
    ["<<"] = "«", [">>"] = "»",
    ["!!"] = "¡", ["??"] = "¿",
    ["eu"] = "€",
  },
}

local function cancelCompose()
  compose.active = false
  compose.firstKey = nil
  if compose.timeout then
    compose.timeout:stop()
    compose.timeout = nil
  end
end

local function showComposeAlert(text)
  hs.alert.closeAll()
  hs.alert.show(text, { textSize = 20, fadeInDuration = 0, fadeOutDuration = 0.3 }, 1)
end

-- Intercept Right Alt (keyCode 61) to enter compose mode
local composeActivator = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
  local keyCode = event:getKeyCode()
  local flags = event:getFlags()

  -- Right Alt keyCode is 61
  if keyCode == 61 then
    -- On key release (no flags remaining), activate compose
    if not flags.alt then
      if not compose.active then
        compose.active = true
        compose.firstKey = nil
        showComposeAlert("Compose ⌨")
        -- Auto-cancel after 3 seconds if no input
        compose.timeout = hs.timer.doAfter(3, function()
          cancelCompose()
          showComposeAlert("Compose cancelled")
        end)
      end
      return true  -- suppress the key
    else
      return true  -- suppress the key down too
    end
  end
  return false
end)

-- Intercept keystrokes while in compose mode
local composeKeyHandler = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
  if not compose.active then return false end

  local char = event:getCharacters()
  if not char or #char == 0 then return true end

  if not compose.firstKey then
    -- First key of the sequence
    compose.firstKey = char
    showComposeAlert("Compose: " .. char)
    -- Reset timeout
    if compose.timeout then compose.timeout:stop() end
    compose.timeout = hs.timer.doAfter(3, function()
      cancelCompose()
      showComposeAlert("Compose cancelled")
    end)
    return true  -- suppress
  else
    -- Second key -- look up the sequence
    local seq = compose.firstKey .. char
    local result = compose.sequences[seq]
    cancelCompose()
    if result then
      hs.eventtap.keyStrokes(result)
      hs.alert.closeAll()
    else
      showComposeAlert("Unknown: " .. seq)
    end
    return true  -- suppress
  end
end)

composeActivator:start()
composeKeyHandler:start()

-- ── Window cycling: Ctrl+Backspace → Cmd+` ──────────────────
-- Mirrors the tmux pane-switch shortcut for macOS window cycling.
-- Passes through in terminal apps so tmux keeps its own binding.
local terminalApps = {
  ["Ghostty"] = true,
  ["iTerm2"] = true,
  ["Terminal"] = true,
  ["Alacritty"] = true,
  ["kitty"] = true,
  ["WezTerm"] = true,
}

local passingThrough = false
hs.hotkey.bind({ "ctrl" }, "delete", function()
  if passingThrough then return end
  local app = hs.application.frontmostApplication()
  local name = app and app:name()
  if name and terminalApps[name] then
    passingThrough = true
    hs.eventtap.keyStroke({ "ctrl" }, "delete", 0)
    passingThrough = false
  else
    hs.eventtap.keyStroke({ "cmd" }, "`", 0)
  end
end)

hs.notify.new({ title = "Hammerspoon", informativeText = "Config loaded. Focus guard ON. Compose key: Right Alt." }):send()
