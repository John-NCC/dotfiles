# 🐧 Dotfiles de John-NCC

Bienvenido a la documentación oficial de mi entorno de trabajo personalizado. Este repositorio transforma una instalación base de Arch Linux en un sistema Wayland profesional, estético y altamente productivo, utilizando **Sway WM** como núcleo.

Todo el sistema ha sido diseñado bajo la filosofía **"Pixel Perfect"** y la paleta de colores **Gruvbox Material Dark (Hard)**.

---

## 🎨 Filosofía de Diseño

Este entorno no es una mezcla aleatoria de configuraciones; es un ecosistema integrado donde cada herramienta respeta las siguientes reglas:

- **Coherencia Visual:** Todo (desde el editor de texto hasta el selector de archivos) usa el tema Gruvbox Material Dark.

- **Tipografía Unificada:**
  - **Código/Terminal:** JetBrains Mono Nerd Font (Ligaduras activadas, tamaño legible).
  - **Interfaz (UI):** Cantarell (Limpia y moderna para barras y menús).

- **Minimalismo Funcional:** Se han eliminado herramientas redundantes (como neofetch o wob) en favor de alternativas modernas y rápidas (fastfetch, swayosd).

- **Modularidad:** Las configuraciones de Sway y Neovim están divididas en múltiples archivos para facilitar el mantenimiento.

---

## 🛠️ Stack Tecnológico

Estas son las herramientas que componen el sistema:

### 🖥️ Entorno de Escritorio (Window Manager)

| Herramienta | Función | Configuración Destacada |
|------------|--------|------------------------|
| **Sway** | Compositor | Configuración modular (`config.d/`), reglas para ventanas flotantes y gestión de energía inteligente con `swayidle`. |
| **Waybar** | Barra de Estado | Diseño estilo Powerline (flechas separadoras), módulos interactivos (clic derecho/izquierdo) y CSS personalizado. |
| **SwayNC** | Notificaciones | Centro de notificaciones lateral con historial, modo "No Molestar" y controles multimedia. Reemplaza a `mako`. |
| **Rofi (Wayland)** | Lanzador | Fork compatible con Wayland. Tema personalizado Gruvbox con iconos grandes y modo lista lateral. |
| **SwayOSD** | OSD | Muestra indicadores elegantes de volumen, brillo y Bloq Mayús en pantalla. Reemplaza al obsoleto `wob`. |
| **Sworkstyle** | Workspaces | Renombra automáticamente los espacios de trabajo con iconos (ej: 1: ) según la aplicación abierta. |
| **Kanshi** | Pantallas | Detecta automáticamente si estás en modo Laptop o Monitor Externo y ajusta la resolución y posición. |

---

### 🚀 Terminal y CLI

| Herramienta | Función | Configuración Destacada |
|------------|--------|------------------------|
| **Kitty** | Terminal | Renderizado por GPU, soporte nativo de imágenes, atajos de pestañas y tema Gruvbox integrado. |
| **Neovim** | Editor | Configuración profesional en Lua con `Lazy.nvim`, `Mason` (LSP automático), `Treesitter` (resaltado) y `LazyDev`. |
| **Yazi** | Gestor de Archivos | Navegación ultrarrápida, previsualización de imágenes/videos y script wrapper para usarlo como selector de archivos del sistema. |
| **Fastfetch** | Info del Sistema | Reemplazo moderno de `Neofetch`. Configurado con un diseño de "caja" (Box Art) personalizado. |
| **Bat** | Visor de Texto | Reemplazo de `cat` con resaltado de sintaxis, paginación automática e integración con Git. |
| **Lazygit** | Cliente Git | Interfaz TUI completa para Git. Integración con `Commitizen` para mensajes de commit estandarizados. |
| **Btop** | Monitor | Monitor de recursos del sistema con tema visual completo. |

---

### 🎵 Multimedia y Utilidades

| Herramienta | Función | Configuración Destacada |
|------------|--------|------------------------|
| **PipeWire** | Motor de Audio | Configuración personalizada de baja latencia y cambio automático de frecuencia de muestreo (44.1k/48k). |
| **Pulsemixer** | Mezclador | Interfaz visual en terminal para controlar volúmenes por aplicación individualmente. |
| **MPV + ModernZ** | Video | Reproductor ligero con interfaz OSC moderna, aceleración por hardware y shaders de alta calidad. |
| **IMV** | Imágenes | Visor minimalista optimizado para Wayland, con atajos tipo Vim. |
| **Zathura** | PDF | Modo "recolor" automático para invertir colores de documentos blancos a oscuros (Gruvbox). |
| **Udiskie** | Montaje USB | Automontaje de dispositivos externos sin necesidad de root, con notificaciones en bandeja. |
| **Grimshot + Swappy** | Capturas | Flujo de trabajo rápido: Capturar área -> Editar/Anotar en Swappy -> Guardar. |

---

## 📥 Guía de Instalación Paso a Paso

### 1. Preparación y Clonado

Asegúrate de estar en tu directorio home. Si ya tienes una carpeta `.config`, haz una copia de seguridad.

```bash
# Copia de seguridad (opcional pero recomendada)
mv ~/.config ~/.config.bak

# Clonar el repositorio
git clone [https://github.com/John-NCC/dotfiles.git](https://github.com/John-NCC/dotfiles.git) ~/.config
```

### 2. Instalación de Paquetes (Arch Linux)

Para que todo funcione **out-of-the-box**, necesitas instalar estos paquetes. He separado los oficiales de los de **AUR (Arch User Repository)**.

### Repositorios Oficiales (Pacman)

```bash
sudo pacman -S sway swaybg swayidle waybar pipewire wireplumber pipewire-pulse \
pavucontrol pulsemixer mpv imv zathura zathura-pdf-mupdf udiskie \
kitty neovim fastfetch bat lazygit btop ripgrep fd fzf zsh eza \
ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols otf-font-awesome inter-font ttf-cantarell \
firefox-developer-edition qalculate-gtk obs-studio grim slurp wl-clipboard \
polkit-gnome xorg-xwayland python-pynvim
```

### AUR (Yay o Paru)

```bash
paru -S rofi-lbonn-wayland-git swaync swayosd-git sworkstyle \
swaylock-effects-git cliphist yazi-git xdg-desktop-portal-termfilechooser-git \
swappy-git
```

### 3. Configuración Post-Instalación (CRÍTICO)

#### A. Permisos de Ejecución para Scripts
```bash
chmod +x ~/.config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
chmod +x ~/.config/swayidle/config
```

#### B. Inicialización Limpia de Neovim
```bash
# Borra plugins, caché y estado anterior
rm -rf ~/.local/share/nvim ~/.cache/nvim ~/.local/state/nvim
```

Ahora abre nvim en tu terminal. Verás una pantalla azul instalando plugins. Espera a que termine y reinicia el editor.

#### C. Reiniciar Servicios de Audio
```bash
systemctl --user restart pipewire pipewire-pulse wireplumber
```

#### D. Recargar caché de fuentes
```bash
fc-cache -fv
```

---

🔧 **Detalles de Personalización**

* **Portales XDG:** Configurado `~/.config/xdg-desktop-portal/portals.conf` para usar wlr para capturas de pantalla y termfilechooser (Yazi) para seleccionar archivos.
* **Neovim:** Migrado de mason-lspconfig handlers externos a internos para evitar errores de carga y se fuerza el uso de Git en Treesitter para descargas robustas.
* **Limpieza:** Se ha eliminado neofetch (reemplazado por fastfetch) y wob (reemplazado por swayosd).

Producido con ❤️ por **John-NCC**
