# Caelestia Remove Borders 🖥️

A simple configuration guide and helper script to remove the outer decorative screen borders from **Caelestia Shell**, keeping only the functional sidebar to maximize screen real estate on laptops and monitors.

---

## 📌 Why this tweak?

By default, Caelestia Shell draws a decorative outer border frame (`border.thickness = 10` and `border.rounding = 25`) surrounding the top, right, and bottom edges of the screen.

On smaller displays (such as 13" or 14" laptop screens) or productivity-focused workflows, these margins take away valuable workspace reserved for windows in Hyprland (`reserved: 60 10 10 10`).

With this configuration:
- The screen exclusion zone changes from `reserved: 60 10 10 10` to `reserved: 56 0 0 0`.
- Tiled applications utilize 100% of the available display height and width.
- The left sidebar remains fully functional with all quick toggles, tray icons, and workspace indicators intact.

---

## 🚀 Quick Installation

Run the installation script in your terminal:

```bash
git clone https://github.com/MethX0/caelestia-remove-borders.git
cd caelestia-remove-borders
chmod +x install.sh
./install.sh
```

What the script does:
1. Automatically creates a timestamped backup of your current `~/.config/caelestia/shell.json`.
2. Sets `thickness: 0` and `rounding: 0` under the `border` property.
3. Hot-reloads Caelestia Shell in the background without closing your active windows or session.

---

## 🛠️ Manual Configuration

If you prefer applying the change manually, open your configuration file:

```bash
nano ~/.config/caelestia/shell.json
```

Add or update the `"border"` section within the root JSON object:

```json
{
    "border": {
        "thickness": 0,
        "rounding": 0
    }
}
```

Then reload Caelestia Shell by executing:

```bash
caelestia shell -d -r
```

---

## 🔄 How to Restore Default Borders

If you ever wish to revert back to Caelestia's default decorative borders:

```bash
./restore.sh
```

Or manually edit `~/.config/caelestia/shell.json` and set `"thickness": 10` and `"rounding": 25`.

---

## 💡 Bonus Tip: Hyprland Window Gaps

If you want to reclaim even more screen real estate by reducing or removing the gaps between application windows in Hyprland, adjust the following values in `~/.config/hypr/variables.lua`:

```lua
windowGapsIn        = 2,  -- Gap between adjacent tiled windows
windowGapsOut       = 4,  -- Outer gap between windows and screen edges
singleWindowGapsOut = 4,  -- Outer gap when only a single window is active
```

---

Made for the **Caelestia Shell** and **Hyprland** community.
