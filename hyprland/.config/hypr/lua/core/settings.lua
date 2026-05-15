local tp_enabled = true

-- Durum dosyasını okuyoruz (Sadece false yazıyorsa kapatıyoruz)
local f = io.open(os.getenv("HOME") .. "/.cache/tp_state", "r")
if f then
	if f:read("*l") == "false" then
		tp_enabled = false
	end
	f:close()
end

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		layout = "dwindle",
	},
	dwindle = { preserve_split = true },

	input = {
		kb_layout = "tr",
		kb_variant = "alt",
		kb_model = "",
		kb_options = "caps:escape_shifted_capslock",
		numlock_by_default = false,
		follow_mouse = 1,
		mouse_refocus = false,
		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
			scroll_factor = 1.0,
			disable_while_typing = true,
		},
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
	accel_profile = "flat",
})
hl.device({
	name = "input-remapper-logitech-gaming-mouse-g502-forwarded",
	sensitivity = -0.3,
	accel_profile = "flat",
})
hl.device({
	name = "syn1b8b:00-06cb:7da2-touchpad",
	enabled = tp_enabled,
})
