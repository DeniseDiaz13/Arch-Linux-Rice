--------------------------------------------------------------------------------
--- MONITORS
--------------------------------------------------------------------------------

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})


--------------------------------------------------------------------------------
--- MY PROGRAMS
--------------------------------------------------------------------------------

local terminal = "alacritty"
local fileManager = "thunar"
local menu = "rofi -show drun -theme ~/.config/rofi/styles/menu.rasi"


--------------------------------------------------------------------------------
--- AUTOSTART
--------------------------------------------------------------------------------

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("swaync")
  hl.exec_cmd("rm -rf ~/.cache/cliphist/db")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)


--------------------------------------------------------------------------------
--- ENVIRONMENT VARIABLES
--------------------------------------------------------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


--------------------------------------------------------------------------------
--- PERMISSIONS (Ecosystem)
--------------------------------------------------------------------------------

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


--------------------------------------------------------------------------------
--- LOOK AND FEEL
--------------------------------------------------------------------------------

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 5,
    border_size = 1,
    col = {
      active_border = "rgba(2a3b4cff)",
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = false,
    allow_tearing = false,
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  master = {
    new_status = "master",
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = false,
  },
})

-- Animations and curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


--------------------------------------------------------------------------------
--- INPUT & GESTURES
--------------------------------------------------------------------------------

hl.config({
  input = {
    kb_layout = "latam, us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
    },
    numlock_by_default = true,
  },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})


--------------------------------------------------------------------------------
--- WINDOW & LAYER RULES
--------------------------------------------------------------------------------

hl.window_rule({ match = { class = "Alacritty" }, opacity = "0.9 0.8 0.8" })
hl.window_rule({ match = { class = "org.pwmt.zathura" }, opacity = "0.9 0.8 0.8" })
hl.window_rule({ match = { class = "firefox" }, no_blur = true })
hl.window_rule({ match = { class = "^(gsimplecal)$" }, float = true, pin = true })
hl.window_rule({ match = { class = "^(gsimplecal)$" }, move = { 1450, 50 } })
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })


--------------------------------------------------------------------------------
-- KEYBINDINGS
--------------------------------------------------------------------------------

local mainMod = "SUPER"

-- Core system binds
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + K", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.exit())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + L", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Custom App Binds
hl.bind(mainMod .. " + f", hl.dsp.exec_cmd("/usr/bin/firejail firefox"))
hl.bind(mainMod .. " + SHIFT + f", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd("zathura"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("hyprctl switchxkblayout evision-akko-keyboard next"))
hl.bind(mainMod .. " + v", hl.dsp.exec_cmd("virt-manager"))
hl.bind(mainMod .. " + y", hl.dsp.exec_cmd("youtube-music"))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("/usr/bin/firejail librewolf"))
hl.bind(mainMod .. " + SHIFT + v",
  hl.dsp.exec_cmd("cliphist list | rofi -dmenu -theme ~/.config/rofi/styles/clipboard.rasi | cliphist decode | wl-copy"))

-- Focus movement
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Workspaces (1-10)
for i = 1, 10 do
  local key = tostring(i % 10)

  -- Switch workspace
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

  -- Move active window to workspace
  hl.bind(mainMod .. " + SHIFT + " .. key,
    hl.dsp.window.move({ workspace = i }))
end

-- Special Workspace (SCRATCHPAD)
hl.bind(mainMod .. " + S",
  hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + SHIFT + S",
  hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll Workspaces
hl.bind(mainMod .. " + mouse_down",
  hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up",
  hl.dsp.focus({ workspace = "e-1" }))

-- Mouse Window Dragging / Resizing
hl.bind(mainMod .. " + mouse:272",
  hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273",
  hl.dsp.window.resize(), { mouse = true })

-- Screenshots
hl.bind(mainMod .. " + PRINT",
  hl.dsp.exec_cmd("hyprshot -m window"))

hl.bind("PRINT",
  hl.dsp.exec_cmd("hyprshot -m output"))

hl.bind("SHIFT + PRINT",
  hl.dsp.exec_cmd("hyprshot -m region"))

-- Multimedia Keys (Volume & Brightness)
hl.bind("XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })

hl.bind("XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })

hl.bind("XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true })

hl.bind("XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true })

hl.bind("XF86MonBrightnessUp",
  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
  { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown",
  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
  { locked = true, repeating = true })

-- Media Player Controls
hl.bind("XF86AudioNext",
  hl.dsp.exec_cmd("playerctl next"),
  { locked = true })

hl.bind("XF86AudioPause",
  hl.dsp.exec_cmd("playerctl play-pause"),
  { locked = true })

hl.bind("XF86AudioPlay",
  hl.dsp.exec_cmd("playerctl play-pause"),
  { locked = true })

hl.bind("XF86AudioPrev",
  hl.dsp.exec_cmd("playerctl previous"),
  { locked = true })
