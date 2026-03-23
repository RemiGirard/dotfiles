# Rust Learning Workflow

## Setup

```bash
# 1. Install tools (already in chezmoi packages)
# ttyper    — terminal typing test
# rustlings — interactive Rust exercises

# 2. Initialize the Rust book typing content
rust-typing --setup

# 3. Initialize rustlings exercises
rustlings init
```

## Daily Workflow

### Step 1: Read + Type a Chapter

```bash
# Fuzzy-pick a chapter and start typing
rt

# Or pick a specific chapter
rt ch03-01

# List all chapters with line counts
rt --list

# Update the book content
rt --setup
```

**Inside ttyper:**
| Key         | Action                   |
|-------------|--------------------------|
| Type        | Match the displayed text |
| `Ctrl+C`   | Quit                     |
| `Ctrl+W`   | Delete last word         |
| `Backspace` | Delete last char         |

Results show WPM, accuracy, and time.

### Step 2: Practice with Rustlings

After typing a chapter, do the matching rustlings exercises to test understanding.

```bash
# Start rustlings (interactive menu)
rustlings

# It will walk you through exercises in order:
#   variables, functions, if, primitive_types,
#   vecs, move_semantics, structs, enums,
#   strings, modules, hashmaps, options,
#   error_handling, generics, traits, lifetimes,
#   tests, iterators, smart_pointers, threads, macros
```

**Inside rustlings:**
| Key     | Action                          |
|---------|---------------------------------|
| `l`     | List all exercises              |
| `Enter` | Open current exercise in editor |
| `n`     | Next exercise                   |
| `h`     | Show hint                       |
| `r`     | Run current exercise            |
| `q`     | Quit                            |

Rustlings opens exercises in `$EDITOR` (nvim). Fix the code until it compiles and passes.

## Chapter → Rustlings Mapping

| Book Chapter | Topic | Rustlings Section |
|-------------|-------|-------------------|
| ch03-01 | Variables | `variables` |
| ch03-02 | Data Types | `primitive_types` |
| ch03-03 | Functions | `functions` |
| ch03-05 | Control Flow | `if` |
| ch04-01/02/03 | Ownership | `move_semantics` |
| ch05-01/02/03 | Structs | `structs` |
| ch06-01/02/03 | Enums | `enums`, `options` |
| ch07 | Modules | `modules` |
| ch08-01 | Vectors | `vecs` |
| ch08-02 | Strings | `strings` |
| ch08-03 | HashMaps | `hashmaps` |
| ch09 | Error Handling | `error_handling` |
| ch10 | Generics/Traits | `generics`, `traits`, `lifetimes` |
| ch11 | Testing | `tests` |
| ch13 | Iterators/Closures | `iterators` |
| ch15 | Smart Pointers | `smart_pointers` |
| ch16 | Concurrency | `threads` |
| ch19 | Macros | `macros` |

## Tips

- Start with ch03 (ch01-02 are intro/setup, minimal code)
- Aim for accuracy over speed — you're learning syntax, not racing
- After typing, re-read the chapter sections you struggled with
- Use `rustlings hint` when stuck — no shame, it's for learning
- Create a `~/Projects/rust-sandbox` for experimenting beyond the book examples
