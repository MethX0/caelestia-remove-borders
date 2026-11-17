# Caelestia Remove Borders 🖥️

Configuración y script para remover los bordes decorativos de pantalla en **Caelestia Shell**, manteniendo únicamente la barra lateral funcional y maximizando el espacio de trabajo en monitores y laptops.

---

## 📌 ¿Por qué este ajuste?

Por defecto, Caelestia Shell incluye un marco perimetral decorativo (`border.thickness = 10` y `border.rounding = 25`) que rodea la pantalla por arriba, abajo y a la derecha. 

En pantallas de laptops (como 13" o 14") o configuraciones orientadas a productividad, estos márgenes reducen el espacio útil reservado para ventanas en Hyprland (`reserved: 60 10 10 10`).

Con este ajuste:
- La zona de exclusión pasa de `reserved: 60 10 10 10` a `reserved: 56 0 0 0`.
- Las ventanas de tus aplicaciones aprovechan el 100% de la altura y anchura disponible.
- La barra lateral izquierda sigue funcionando con todos sus widgets e indicadores.

---

## 🚀 Instalación Rápida

Ejecuta el script de instalación en tu terminal:

```bash
git clone https://github.com/MethX0/caelestia-remove-borders.git
cd caelestia-remove-borders
chmod +x install.sh
./install.sh
```

El script:
1. Crea un respaldo automático de tu archivo `~/.config/caelestia/shell.json`.
2. Aplica `thickness: 0` y `rounding: 0` a la propiedad `border`.
3. Recarga Caelestia Shell en caliente sin cerrar tu sesión.

---

## 🛠️ Método Manual

Si prefieres hacerlo a mano, abre tu archivo de configuración:

```bash
nano ~/.config/caelestia/shell.json
```

Agrega o modifica la sección `"border"` dentro del objeto JSON principal:

```json
{
    "border": {
        "thickness": 0,
        "rounding": 0
    }
}
```

Luego recarga Caelestia Shell con el siguiente comando:

```bash
caelestia shell -d -r
```

---

## 🔄 Cómo Restaurar los Bordes Originales

Si en cualquier momento deseas volver a los bordes por defecto:

```bash
./restore.sh
```

O edita manualmente `shell.json` estableciendo `"thickness": 10` y `"rounding": 25`.

---

## 💡 Tip Adicional: Gaps de Ventanas en Hyprland

Si también deseas reducir o eliminar los espacios entre ventanas dentro de Hyprland para aprovechar aún más la pantalla, puedes ajustar en `~/.config/hypr/variables.lua`:

```lua
windowGapsIn        = 2,  -- Espacio entre ventanas adyacentes
windowGapsOut       = 4,  -- Espacio entre las ventanas y el borde de pantalla
singleWindowGapsOut = 4,  -- Espacio cuando solo hay una ventana activa
```

---

Desarrollado como aporte para la comunidad de **Caelestia Shell** y usuarios de **Hyprland**.
