-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })


-- ============================================================
-- GPU: desktop e apps na Intel; NVIDIA só sob demanda (prime-run)
-- ============================================================
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("LIBVA_DRIVER_NAME", "iHD")


-- ============================================================
-- Janelas flutuantes
-- ============================================================
local function float_app(name, class, size)
    hl.window_rule({
        name   = name,
        match  = { class = class },
        float  = true,
        center = true,
        size   = size or "900 600",
    })
end

float_app("gnome-text-editor-float", "^(org.gnome.TextEditor)$")
float_app("laradumps-float", "(?i)laradumps")
float_app("loupe-float", "^(org.gnome.Loupe)$")
float_app("vlc-float", "^(vlc)$", "1100 650")
float_app("celluloid-float", "^(io.github.celluloid_player.Celluloid)$", "1100 650")
float_app("calculator-float", "^(org.gnome.Calculator)$", "400 600")
float_app("sysmonitor-float", "^(org.gnome.SystemMonitor)$", "1000 650")

hl.window_rule({
    name   = "phpstorm-dialogs-float",
    match  = {
        class = "^(jetbrains-phpstorm)$",
        initial_title = "negative:^$",
    },
    float  = true,
    center = true,
})
