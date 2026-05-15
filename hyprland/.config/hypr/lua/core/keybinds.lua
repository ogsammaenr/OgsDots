local dsp = hl.dsp
local bind = hl.bind
local mainMod = "SUPER"
local apps = require("lua.core.apps")

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Sınırlandırılmış (1-7) Workspace Geçişleri
-- script kullanimi: action(prev/next) Min Max
bind(mainMod .. " + CTRL + X", dsp.exec_cmd("~/.config/hypr/scripts/ws_nav.sh prev 1 7"), { repeating = true })
bind(mainMod .. " + CTRL + C", dsp.exec_cmd("~/.config/hypr/scripts/ws_nav.sh next 1 7"), { repeating = true })

-- === === App Bindings === === --
bind(mainMod .. " + T", dsp.exec_cmd(apps.terminal))
bind(mainMod .. " + E", dsp.exec_cmd(apps.file_manager))
bind(mainMod .. " + B", dsp.exec_cmd(apps.browser))
bind(mainMod .. " + SPACE", dsp.exec_cmd(apps.launcher))
bind(mainMod .. " + SHIFT + C", dsp.exec_cmd(apps.calculator))

bind("SUPER + Q", dsp.window.close())

-- Move focus with mainMod + h/j/k/l
bind(mainMod .. " + h", dsp.focus({ direction = "left" }))
bind(mainMod .. " + l", dsp.focus({ direction = "right" }))
bind(mainMod .. " + k", dsp.focus({ direction = "up" }))
bind(mainMod .. " + j", dsp.focus({ direction = "down" }))

-- Resize Windows with mainMod + CTRL + h/j/k/l
local resizeStep = 20
bind(mainMod .. " + CTRL + h", dsp.window.resize({ x = -resizeStep, y = 0, relative = true }), { repeating = true })
bind(mainMod .. " + CTRL + l", dsp.window.resize({ x = resizeStep, y = 0, relative = true }), { repeating = true })
bind(mainMod .. " + CTRL + k", dsp.window.resize({ x = 0, y = resizeStep, relative = true }), { repeating = true })
bind(mainMod .. " + CTRL + j", dsp.window.resize({ x = 0, y = -resizeStep, relative = true }), { repeating = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind(mainMod .. " + mouse:272", dsp.window.drag(), { mouse = true })
bind(mainMod .. " + mouse:273", dsp.window.resize(), { mouse = true })

-- === === === === === === === === === === === === === === === --

-- Laptop multimedia keys for volume and LCD brightness
bind(
	"XF86AudioRaiseVolume",
	dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
bind(
	"XF86AudioLowerVolume",
	dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
bind("XF86AudioMute", dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
bind(
	"XF86AudioMicMute",
	dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
bind("XF86MonBrightnessUp", dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
bind("XF86MonBrightnessDown", dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

bind("XF86AudioNext", dsp.exec_cmd("playerctl next"), { locked = true })
bind("XF86AudioPause", dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPlay", dsp.exec_cmd("playerctl play-pause"), { locked = true })
bind("XF86AudioPrev", dsp.exec_cmd("playerctl previous"), { locked = true })
