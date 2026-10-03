-- ============================================================
--  Bindings pessoais (estilo Vim) - Omarchy 4
-- ============================================================

local vim = "/home/tiago/.local/bin/hypr-vim"

-- ===== Libera teclas padrão que colidem com o fluxo Vim =====
-- J, K e L eram: toggle split, menu de atalhos, toggle de layout
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")

-- Colados no resize (Super + Ctrl + Shift + HJKL): fáceis de acionar sem querer
hl.unbind("SUPER + CTRL + H")   -- menu de hardware (continua em Super + Space)
hl.unbind("SUPER + CTRL + K")   -- atalhos do Herdr (Tmux continua em Super + Alt + K)
hl.unbind("SUPER + CTRL + L")   -- bloquear tela (movido abaixo)

-- Google Maps (padrão) liberado: Super + Shift + S agora é screenshot (tecla F9 do K380s)
hl.unbind("SUPER + SHIFT + S")

-- Bloquear tela: Super + Shift + Escape
o.bind("SUPER + SHIFT + ESCAPE", "Lock system", "omarchy-system-lock")

-- Funções que saíram de J/K/L, agora em teclas livres
o.bind("SUPER + F1",       "Keybindings",             "omarchy menu keybindings")
o.bind("SUPER + CTRL + J", "Toggle window split",     hl.dsp.layout("togglesplit"))
o.bind("SUPER + ALT + L",  "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- ===== Foco: Super + HJKL (na borda, vai ao workspace vizinho) =====
o.bind("SUPER + H", "Focus left / prev workspace",  vim .. " focus h")
o.bind("SUPER + J", "Focus down",                   vim .. " focus j")
o.bind("SUPER + K", "Focus up",                     vim .. " focus k")
o.bind("SUPER + L", "Focus right / next workspace", vim .. " focus l")

-- ===== Mover: Super + Shift + HJKL (na borda, leva a janela ao workspace vizinho) =====
o.bind("SUPER + SHIFT + H", "Move window left / prev workspace",  vim .. " move h")
o.bind("SUPER + SHIFT + J", "Move window down",                   vim .. " move j")
o.bind("SUPER + SHIFT + K", "Move window up",                     vim .. " move k")
o.bind("SUPER + SHIFT + L", "Move window right / next workspace", vim .. " move l")

-- ===== Redimensionar: Super + Ctrl + Shift + HJKL =====
o.bind("SUPER + CTRL + SHIFT + H", "Shrink window width",  hl.dsp.window.resize({ x = -100, y = 0,   relative = true }))
o.bind("SUPER + CTRL + SHIFT + L", "Grow window width",    hl.dsp.window.resize({ x = 100,  y = 0,   relative = true }))
o.bind("SUPER + CTRL + SHIFT + K", "Shrink window height", hl.dsp.window.resize({ x = 0,    y = -100, relative = true }))
o.bind("SUPER + CTRL + SHIFT + J", "Grow window height",   hl.dsp.window.resize({ x = 0,    y = 100,  relative = true }))

-- ===== Janelas e apps (atalhos simples, sem Shift) =====
-- O padrão do Omarchy 4 só fecha com Super + W; Super + Q é adicionado aqui
o.bind("SUPER + Q",       "Close window",                 hl.dsp.window.close())
o.bind("SUPER + B",       "Browser",                      "omarchy-launch-browser")
o.bind("SUPER + E",       "File manager",                 "omarchy-launch-nautilus")
o.bind("SUPER + ALT + E", "File manager in terminal cwd", "omarchy-launch-nautilus-cwd")
o.bind("SUPER + N",       "Editor (Neovim)",              "omarchy-launch-editor")
o.bind("SUPER + M",       "Music (Spotify)",              "omarchy-launch-spotify")
o.bind("SUPER + D",       "Docker (LazyDocker)",          { tui = "omarchy-launch-docker-tui" })

-- ===== Microfone =====
o.bind("SUPER + ALT + M", "Mute microphone", "omarchy-audio-input-mute", { locked = true })

-- ===== Teclas especiais do Logitech Pebble Keys 2 K380s (modo Windows) =====
-- F9 (print): o teclado envia Super + Shift + S
o.bind("SUPER + SHIFT + S", "Screenshot (K380s F9)", "omarchy-capture-screenshot")
-- F8 (emoji): o teclado envia Ctrl + Shift + Alt + Super + Space
o.bind("SUPER + CTRL + SHIFT + ALT + SPACE", "Emojis (K380s F8)", "omarchy-shell shell toggle omarchy.emojis")
-- F7 (microfone) envia Super + H e colide com o foco à esquerda.
-- Decisão: mute do microfone fica em Super + Alt + M (bind acima).
