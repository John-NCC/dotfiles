# 🐧 Dotfiles de John-NCC

Mi configuración personal para un entorno de trabajo productivo en Linux, enfocado en **Sway WM** y herramientas de terminal modernas.

## 🛠️ Stack Tecnológico

| Categoría | Herramienta |
| :--- | :--- |
| **Window Manager** | [Sway](https://swaywm.org/) |
| **Terminal** | [Kitty](https://swapp.dev/bin/kitty/) |
| **Editor** | [Neovim](https://neovim.io/) (Lazy.nvim) |
| **Shell Tools** | Bat, Fastfetch, Lazygit, Yazi |
| **Barra/Notificaciones** | Waybar & SwayNC |
| **Lanzador** | Rofi (Wayland) |

## 🚀 Instalación

> **Advertencia:** No copies todo directamente a tu `.config` sin revisar los archivos primero.

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/John-NCC/dotfiles.git ~/.config
   ```

2. Instalar las dependencias (Arch Linux):
   ```bash
   sudo pacman -S sway waybar kitty neofetch bat lazygit yazi rofi-lbonn-wayland-git
   ```

## 📂 Estructura del Repo
Este repositorio contiene configuraciones limpias. Se han excluido binarios, cachés y datos sensibles (como sesiones de navegador o llaves privadas) mediante un archivo `.gitignore` estricto.

---
Producido con ❤️ por [John-NCC](https://github.com/John-NCC)
