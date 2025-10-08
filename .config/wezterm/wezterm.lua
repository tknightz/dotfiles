local wezterm = require("wezterm")
-- local fontname = "IBM Plex Mono"
local fontname = "Monaspace Neon Frozen"
-- Commenting out the distinct italic font for potential performance gain.
-- If you value the aesthetic highly and performance is acceptable, you can re-enable this.
local italic_fontname = "Cartograph CF"
local gpus = wezterm.gui.enumerate_gpus()

local weight_maps = {
	normal = "Regular",
	bold = "Medium",
}

local preferred_gpu_adapter = nil
for i, gpu in ipairs(gpus) do
	-- Adjust this string to match the exact name of your AMD GPU from `wezterm ls-gpus`
	if string.find(gpu.name, "AMD Radeon", 1, true) then
		preferred_gpu_adapter = gpu -- Use the GPU object directly
		break
	end
end

if not preferred_gpu_adapter and #gpus > 0 then
	preferred_gpu_adapter = gpus[2]
end

-- ╭──────────────────────────────────────────────────────────╮
-- │         A helper function for my fallback fonts          │
-- ╰──────────────────────────────────────────────────────────╯
function _font_with_fallback(font, params)
	local names = {
		{
			family = font,
			weight = params.weight,
			italic = params.italic,
			scale = params.scale,
		},
		-- Removed IBM Plex Mono as a general fallback to reduce overhead
		{ family = "Symbols Nerd Font Mono", scale = 0.85, weight = "Regular" },
		{ family = "Noto Color Emoji", weight = "Regular" },
	}
	return wezterm.font_with_fallback(names)
end

function _font_config(fontname, weight_maps)
	local font = _font_with_fallback(fontname, { weight = weight_maps.normal })
	local rules = {
		{
			intensity = "Normal",
			italic = false,
			font = _font_with_fallback(
				fontname,
				{ weight = weight_maps.normal, italic = false, intensity = "Regular", scale = 1.05 }
			),
		},
		{
			intensity = "Bold",
			italic = false,
			font = _font_with_fallback(fontname, { weight = weight_maps.bold, intensity = "Bold", scale = 1.05 }),
		},
		-- Removed specific italic font rule. WezTerm will now use JetBrains Mono's italic variant
		-- or synthesize italics if no specific italic font is found for JetBrains Mono.
		{
			intensity = "Bold",
			italic = true,
			font = _font_with_fallback(
				italic_fontname,
				{ weight = weight_maps.bold, italic = true, intensity = "Bold", scale = 1.1 }
			),
		},
		{
			intensity = "Normal",
			italic = true,
			font = _font_with_fallback(
				italic_fontname,
				{ weight = weight_maps.normal, italic = true, intensity = "Regular", scale = 1.1 }
			),
		},
	}

	return {
		font = font,
		rules = rules,
	}
end

local font_configs = _font_config(fontname, weight_maps)

-- ╭──────────────────────────────────────────────────────────╮
-- │                        Config sets                       │
-- ╰──────────────────────────────────────────────────────────╯
return {
	font = font_configs.font,
	font_rules = font_configs.rules,
	font_size = 9,
	line_height = 1.5,

	underline_position = -6, -- Keep if desired, minor performance impact
	warn_about_missing_glyphs = false,
	custom_block_glyphs = true,

	-- colors
	bold_brightens_ansi_colors = true,
	color_scheme = "Tinacious Design (Dark)",
	colors = {
		cursor_bg = "#54FF71",
		foreground = "#ada4c0",
		background = "#121212",
		cursor_border = "#bbbbbb",
		cursor_fg = "#000000",
		selection_bg = "#453b39",
		selection_fg = "#b6bbc0",
		ansi = { "#33333f", "#ff568e", "#64de83", "#efff73", "#73a9ff", "#946ff7", "#62c6da", "#dedeff" },
		brights = { "#43435a", "#ff69a2", "#73de8a", "#f3ff85", "#85b6ff", "#a481f7", "#71c2d9", "#ebebff" },
	},

	-- typing engine
	-- Set use_ime to false if you don't frequently use an IME (e.g., for East Asian languages)
	-- to potentially reduce input latency. Re-enable if you need IME functionality.
	use_ime = false,
	-- xim_im_name = "ibus",

	-- key mappings
	keys = {
		{ key = "Backspace", mods = "CTRL", action = wezterm.action({ SendKey = { key = "w", mods = "CTRL" } }) },
		{ key = "/", mods = "CTRL", action = wezterm.action({ SendKey = { key = "_", mods = "CTRL" } }) },
	},

	-- background image
	background = {
		-- Removed the redundant Color layer as the File layer with opacity=1 covers it.
		{
			source = {
				File = "/home/tknightz/Pictures/collection/terminal-bg.png",
			},
			opacity = 1,
			vertical_align = "Middle",
			horizontal_align = "Center", -- Added for consistency, though 'width' and 'height' = "120%" would effectively center it
			-- Consider optimizing the actual image file size and dimensions if it's very large.
		},
	},

	-- sizes
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_rows = 23,
	initial_cols = 140,

	-- misc
	default_cursor_style = "BlinkingBar",
	force_reverse_video_cursor = true,
	audible_bell = "Disabled",
	use_fancy_tab_bar = false,
	enable_tab_bar = false,

  freetype_render_target = "Normal",
	front_end = "WebGpu",
	-- webgpu_force_fallback_adapter = false,

	-- Pass the GPU object directly if found, otherwise it will be nil and WezTerm will pick
	-- its default (usually the first available).
	webgpu_preferred_adapter = preferred_gpu_adapter,
	-- webgpu_preferred_adapter = gpus[1],
	webgpu_power_preference = "HighPerformance",
	-- animation_fps = 120,
	-- max_fps = 120, -- Adjust this to match your monitor's refresh rate if higher for smoother feel,
	-- or slightly lower (e.g., 60) if still experiencing issues at 75Hz.
}
