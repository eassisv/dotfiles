local wezterm = require("wezterm")
local config = {}

config.enable_wayland = true
config.audible_bell = "Disabled"

-- config.color_scheme = 'catppuccin-mocha'
-- config.color_scheme = "rose-pine"
-- config.color_scheme = 'One Dark (Gogh)'
-- config.color_scheme = "Snazzy"
-- config.color_scheme = "Gruber (base16)"

config.font = wezterm.font({
	-- family = "Fira Code",
	-- family = "IBM Plex Mono",
	-- family = "Monaspace Neon",
	-- family = "Ubuntu Mono",
	-- family = "Iosevka Term",
	-- family = "Source Code Pro",
	family = "Hack",
	weight = "Regular",
	stretch = "Normal",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.font_size = 12
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "VerticalLcd"
config.warn_about_missing_glyphs = false
config.enable_scroll_bar = true

-- local is_charging = wezterm.battery_info().state == "Charging"

-- if is_charging then
-- 	config.front_end = "OpenGL"
-- else
-- 	config.front_end = "Software"
-- end

-- config.webgpu_power_preference = "LowPower"

config.colors = {
	background = "#141414",

	cursor_bg = "#e1e1e1",
	cursor_fg = "#111",
}

-- config.window_background_opacity = 0.8
-- config.background = {
--   {
--     source = {
--       -- File = os.getenv('HOME') .. '/.config/wezterm/wallpapers/cartoon-highway-moon.jpg'
--       File = os.getenv('HOME') .. '/.config/wezterm/wallpapers/wallpaperflare.com_wallpaper.jpg'
--     },
--     hsb = { brightness = 0.01 }
--   }
-- }

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE"

config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}

config.keys = {
	{
		key = "RightArrow",
		mods = "SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},

	{
		key = "LeftArrow",
		mods = "SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
}

return config
