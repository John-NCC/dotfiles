#!/usr/bin/env bash
# Wrapper para integrar Yazi con xdg-desktop-portal-termfilechooser en Kitty
# Autor: John-NCC (Optimized)

set -e

# Argumentos pasados por el portal
multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

# Comando de terminal (Kitty)
# Usamos el título "termfilechooser" para que Sway lo detecte y lo haga flotante
TERM_CMD="kitty --title termfilechooser --"

# Comando base de Yazi
YAZI_CMD="yazi"

# Lógica de selección según el modo (Abrir, Guardar, Directorio)
if [ "$save" = "1" ]; then
    # MODO GUARDAR
    # Yazi escribirá la ruta seleccionada en el archivo $out.
    # Si 'path' existe, inicia ahí.
    $TERM_CMD $YAZI_CMD --chooser-file="$out" "$path"

elif [ "$directory" = "1" ]; then
    # MODO DIRECTORIO
    # Usamos --cwd-file para que Yazi escriba el directorio actual al salir.
    cwd_temp="$out.cwd"
    $TERM_CMD $YAZI_CMD --chooser-file="$out" --cwd-file="$cwd_temp" "$path"
    
    # Si existe el archivo cwd (directorio), sobrescribimos la salida con él
    # Esto corrige el problema de seleccionar carpetas en Yazi
    if [ -f "$cwd_temp" ] && [ -s "$cwd_temp" ]; then
        mv "$cwd_temp" "$out"
    elif [ -f "$out" ]; then
        # Fallback: si el usuario seleccionó una carpeta con espacio/enter en lugar de entrar
        # A veces Yazi escribe la carpeta seleccionada en chooser-file
        : 
    fi
    # Limpieza
    rm -f "$cwd_temp"

elif [ "$multiple" = "1" ]; then
    # MODO MÚLTIPLE
    $TERM_CMD $YAZI_CMD --chooser-file="$out" "$path"

else
    # MODO ARCHIVO ÚNICO (Abrir)
    $TERM_CMD $YAZI_CMD --chooser-file="$out" "$path"
fi
