# Neovim config

Config personal de Neovim en Lua, gestionada con [lazy.nvim](https://github.com/folke/lazy.nvim).

## Setup C / C++

Stack activo para editar archivos C y C++.

### Componentes

| Capa | Plugin | Rol |
|------|--------|-----|
| LSP | `clangd` via Mason | Indexado en background, clang-tidy, inlay hints |
| Treesitter | parsers `c`, `cpp`, `cmake` | Resaltado, folding, indent |
| Formato | `clang-format` + `cmake-format` via conform.nvim | Format on save |
| Lint | `cppcheck` via nvim-lint | Análisis ortogonal al LSP |
| Debug | `codelldb` via nvim-dap | Adapter local |
| Snippets | LuaSnip | Ver `lua/snippets/` |
| Estándar | `c++23` (fallback clangd), C23 disponible vía `.clangd` per-project | Último estándar ISO |

### Estándar C++

clangd se lanza con `fallbackFlags = { "-std=c++23" }`. Cobertura completa en clangd 17+. Para proyectos C++20 estricto (sin 23), sobreescribir con `.clangd` en la raíz del proyecto:

```yaml
CompileFlags:
  Add: [-std=c++20, -Wall]
  Remove: [-std=c++23]
```

### Estándar C

No hay fallback único para C porque el estándar lo deduce clangd del shebang o extensiones. Para C23 explícito por proyecto:

```yaml
CompileFlags:
  Add: [-std=c23]
```

### compile_commands.json (necesario para goto/definición cross-file)

clangd ya arranca con `--background-index` y un fallback flag, pero para goto a definiciones entre unidades de compilación necesitás `compile_commands.json`. Tres caminos:

**1. CMake (recomendado).** Al configurar el build:
```sh
cmake -B build -S . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ln -s build/compile_commands.json .
```
clangd detecta el symlink automáticamente.

**2. Make / autotools via `bear`:**
```sh
bear -- make
```
Genera `compile_commands.json` interceptando invocaciones del compilador.

**3. `compiledb` (alternativa Python):**
```sh
pipx install compiledb
compiledb make
```

### .clang-format recomendado

Poné un `.clang-format` en la raíz del proyecto. conform.nvim lo usa si existe; si no, aplica defaults. Plantilla base:

```yaml
BasedOnStyle: LLVM
IndentWidth: 4
ColumnLimit: 100
Language: Cpp
Standard: c++23
```

### Teclas

| Tecla | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gD` | Ir a declaración |
| `gi` | Ir a implementación |
| `gr` | Referencias |
| `K` | Hover |
| `<leader>rn` | Renombrar símbolo |
| `<leader>ca` | Code action (ambos modos n y v) |
| `<leader>ds` | Símbolos del documento |
| `<leader>ws` | Símbolos del workspace |
| `]d` / `[d` | Siguiente / anterior diagnóstico |
| `<leader>de` | Diagnóstico en float |
| `<leader>q` | Diagnósticos a loclist |
| `<F5>` | Dap continue |
| `<F10>` | Dap step over |
| `<F11>` | Dap step into |
| `<F12>` | Dap step out |
| `<leader>db` | Toggle breakpoint |
| `<leader>du` | Toggle DAP UI |

Los keymaps LSP se definen en `lua/plugins/lsp-keymaps.lua`; el grupo which-key `d` los agrupa en buffer.

## Instalación

```sh
git clone <repo-url> ~/.config/nvim
nvim
# Lazy clona plugins; Mason instala clangd, clang-format, cmake-format, cppcheck, codelldb al primer arranque de nvim.
```
