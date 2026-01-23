# 🐧 Dotfiles de John-NCC

Bienvenido a mi configuración personal para Arch Linux. Este repositorio despliega un entorno de trabajo Wayland basado en Sway WM, diseñado para la productividad, el minimalismo y la estética coherente.

Todo el sistema sigue estrictamente la paleta de colores **Gruvbox Material Dark** y utiliza tipografías optimizadas para el desarrollo de software.

## 🎨 Características Principales

* **Entorno:** Sway WM con bordes *pixel-perfect* y gestión inteligente de ventanas.
* **Panel HUD:** Waybar y SwayNC configurados con un diseño compacto y profesional ("Obsidian Style").
* **Terminal:** Kitty con soporte gráfico nativo y renderizado por GPU.
* **Editor:** Neovim ultra-vitaminado (Lazy, Mason, Treesitter) listo para programar.
* **Gestión de Archivos:** Flujo de trabajo basado en terminal con Yazi e integración en diálogos del sistema.

## 🛠️ Stack Tecnológico

| Categoría | Herramienta | Función |
| :--- | :--- | :--- |
| **Window Manager** | Sway | Compositor principal. |
| **Barra** | Waybar | Información del sistema y workspaces. |
| **Notificaciones** | SwayNC | Centro de control y notificaciones. |
| **Lanzador** | Rofi (Wayland) | Menú de apps, ventanas y calculadora. |
| **OSD** | SwayOSD | Indicadores de volumen y brillo en pantalla. |
| **Terminal** | Kitty | Emulador de terminal. |
| **Editor** | Neovim | IDE basado en terminal. |
| **Archivos** | Yazi | Gestor de archivos rápido escrito en Rust. |
| **Info Sistema** | Fastfetch | Resumen de hardware y software. |
| **Git** | Lazygit | Interfaz de terminal para Git. |

## 🚀 Guía de Instalación

Sigue estos pasos para replicar este entorno en una instalación limpia de Arch Linux.

### 1. Clonar el repositorio
Descarga estos archivos en tu carpeta de configuración local.

```bash
# Haz un backup si ya tienes configuraciones previas
# mv ~/.config ~/.config.bak

git clone [https://github.com/John-NCC/dotfiles.git](https://github.com/John-NCC/dotfiles.git) ~/.config

```
## 2. Instalación de Paquetes
Necesitarás paquetes de los repositorios oficiales y de AUR.


### Repositorios Oficiales (Pacman):
```bash
sudo pacman -S sway swaybg swayidle waybar pipewire wireplumber pipewire-pulse \
pavucontrol pulsemixer mpv imv zathura zathura-pdf-mupdf udiskie \
kitty neovim fastfetch bat lazygit btop ripgrep fd fzf zsh eza \
ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols otf-font-awesome inter-font ttf-cantarell \
firefox-developer-edition qalculate-gtk obs-studio grim slurp wl-clipboard \
polkit-gnome xorg-xwayland python-pynvim
```


### AUR (Yay o Paru):
Estas herramientas son vitales para la estética y funciones específicas (como el selector de archivos Yazi o el Blur en bloqueo).


```bash
paru -S rofi-lbonn-wayland-git swaync swayosd-git sworkstyle \
swaylock-effects-git cliphist yazi-git xdg-desktop-portal-termfilechooser-git \
swappy-git
```


## 3. Configuración Post-Instalación (Obligatorio)
Para que todo funcione correctamente, ejecuta estos comandos finales:


### A. Permisos de Ejecución
Habilita los scripts personalizados para la gestión de inactividad y el selector de archivos.


```bash
chmod +x ~/.config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
chmod +x ~/.config/swayidle/config
```


### B. Inicializar Neovim
Limpia cualquier caché previa para permitir que el gestor de plugins (Lazy.nvim) se instale limpiamente.


```bash
rm -rf ~/.local/share/nvim ~/.cache/nvim ~/.local/state/nvim
```


Abre nvim una vez para que se instalen los plugins y servidores LSP automáticamente.


### C. Activar Servicios de Audio
Aplica la configuración de baja latencia.


```bash
systemctl --user restart pipewire pipewire-pulse wireplumber
```


### D. Fuentes
Regenera la caché para detectar las Nerd Fonts.


```bash
fc-cache -fv
```


## ⌨️ Atajos de Teclado Principales (Cheat Sheet)
La tecla modificadora (Mod) es la tecla Super (Windows).


| Atajo | Acción |
|---|---|
| Mod + Enter | Abrir Terminal (Kitty) |
| Mod + D | Abrir Lanzador (Rofi) |
| Mod + T | Abrir Gestor de Archivos (Yazi flotante) |
| Mod + Shift + T | Abrir Navegador (Firefox Dev) |
| Mod + N | Abrir Centro de Notificaciones |
| Mod + Q | Cerrar ventana actual |
| Mod + F | Pantalla completa |
| Mod + Shift + Space | Alternar ventana Flotante/Tiling |
| Mod + Shift + S | Captura de pantalla (Área) + Edición |
| Mod + Shift + C | Recargar configuración de Sway |
| Mod + Shift + E | Salir de Sway / Cerrar sesión |


---


Configuración mantenida por John-NCC.
