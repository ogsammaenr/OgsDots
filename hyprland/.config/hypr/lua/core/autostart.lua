-- ~/.config/hypr/lua/core/autostart.lua

hl.config({
	exec_once = {
		-- Temel Servisler ve Dinleyiciler
		"~/.config/ml4w/listeners.sh --startall",
		"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
		"~/.config/ml4w/scripts/ml4w-wallpaper-app --restore",
		"~/.config/ml4w/scripts/ml4w-autostart",

		-- Tema, Arayüz ve Arka Plan Uygulamaları
		"~/.config/hypr/scripts/gtk.sh",
		"swaync",
		"hypridle",
		"wl-paste --watch cliphist store",

		-- Özel Scriptler
		"~/.config/hypr/scripts/cleanup.sh",

		-- Çalışma Alanlarına (Workspace) Sessiz Atamalar
		"[workspace 1 silent] kitty",
		"[workspace 2 silent] zen-browser",

		-- Input Remapper (Çift tırnak çakışmasını önlemek için [[ ]] kullanıyoruz)
		[[sleep 2 && input-remapper-control --command stop-all && input-remapper-control --command start --device "Logitech Gaming Mouse G502" --preset "mouse macro"]],
	},

	exec = {
		-- Her 'hyprctl reload' atıldığında yeniden okunacak komutlar
		"~/.config/com.ml4w.hyprlandsettings/hyprctl.sh",
	},
})
