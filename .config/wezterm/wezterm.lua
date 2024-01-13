local wezterm = require 'wezterm';
local fontname = "Operator Mono"
-- local fontname = "JetBrains Mono";
local gpus = wezterm.gui.enumerate_gpus();


local weight_maps = {
  normal = 325,
  bold = "DemiLight",
}

--  ╭──────────────────────────────────────────────────────────╮
--  │         A helper function for my fallback fonts          │
--  ╰──────────────────────────────────────────────────────────╯
function _font_with_fallback(font, params)
  local names = {
    { family = font, weight = params.weight, italic = params.italic },
    { family = "IBM Plex Mono", weight = params.intensity, italic = params.italic },
    { family = "Symbols Nerd Font Mono", scale = 0.8, weight = "Regular" },
    { family = "Noto Color Emoji", weight = "Regular" }
  }
  return wezterm.font_with_fallback(names)
end

function _font_config(fontname, weight_maps)
  local font = _font_with_fallback(fontname, { weight = weight_maps.normal })
  local rules = {
    {
      intensity = 'Bold',
      italic = false,
      font = _font_with_fallback(fontname, { weight = weight_maps.bold, intensity = 'Bold' })
    },
    {
      intensity = 'Bold',
      italic = true,
      font = _font_with_fallback(fontname, { weight = weight_maps.bold, italic = true, intensity = 'Bold' })
    },
    {
      intensity = 'Normal',
      italic = true,
      font = _font_with_fallback(fontname, { weight = weight_maps.normal, italic = true, intensity = 'Regular' })
    },
  }

  return {
    font = font,
    rules = rules,
  }
end

local font_configs = _font_config(fontname, weight_maps)

--  ╭──────────────────────────────────────────────────────────╮
--  │                       Config sets                        │
--  ╰──────────────────────────────────────────────────────────╯
return {
  font = font_configs.font,
  font_rules = font_configs.rules,
  -- font_size = 9.35,
  font_size = 10.2,

  underline_position = -6,
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
    -- ansi = {"#1b1d1e","#f92672","#a6e22e","#fd971f","#57c7ff","#9e6ffe","#5e7175","#ccccc6"},
    -- brights = {"#505354","#ff669d","#beed5f","#e6db74","#66d9ef","#9e6ffe","#a3babf","#f8f8f2"},
    ansi = {"#33333f", "#ff568e", "#64de83", "#efff73", "#73a9ff", "#946ff7", "#62c6da", "#dedeff"},
    brights = {"#43435a", "#ff69a2", "#73de8a", "#f3ff85", "#85b6ff", "#a481f7", "#71c2d9", "#ebebff"},
  },

  -- typing engine
  use_ime = true,
  xim_im_name = 'ibus',

  -- key mappings
  keys = {
    {key="Backspace", mods="CTRL", action=wezterm.action{SendKey={key="w", mods="CTRL"}}},
    {key="/", mods="CTRL", action=wezterm.action{SendKey={key="_", mods="CTRL"}}},
  },


  line_height = 1.57,

  -- background image
  background = {
    {
      source = {
        Color = '#101017',
      },
      height = "120%",
      width = "120%",
      horizontal_align = "Center",
      vertical_align = "Middle",
    },
    {
      source = {
        File = "/home/tknightz/Downloads/Pictures/bg_21.png",
      },
      opacity = 0.03,
      vertical_align = "Middle",
    }
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

  front_end = "WebGpu",
  webgpu_preferred_adapter = gpus[1],
  webgpu_power_preference = "HighPerformance",
}
