local wezterm = require 'wezterm';
-- local fontname = "Operator Mono for Powerline";
local fontname = "JetBrains Mono";
-- local fontname = "Ligalex Mono";
local gpus = wezterm.gui.enumerate_gpus();

function convert_params(params)
  local weight_converter = {
    Regular = "Regular",
    DemiBold = "DemiBold",
    Medium = "Medium",
    Bold = "Bold",
    ExtraBold = "ExtraBold",
  }

  return {
    weight = params.weight,
    italic = params.italic,
    assume_emoji_presentation = true,
  }
end


-- A helper function for my fallback fonts
function font_with_fallback(font, params)
  local names = {
    { family = font },
    { family = "JetBrains Mono" },
    { family = "Symbols Nerd Font Mono", scale = 0.85 },
    { family = "FiraMono Nerd Font", scale = 0.85 }
  }
  return wezterm.font_with_fallback(names, params)
end

return {
  font = font_with_fallback(fontname, { weight = "Medium" }),
  underline_position = -3.5,
  -- font_rules = {
  --   {
  --     intensity = 'Bold',
  --     italic = false,
  --     font = font_with_fallback(fontname, { weight = 'Medium' })
  --   },
  --   {
  --     intensity = 'Bold',
  --     italic = true,
  --     font = font_with_fallback(fontname, { weight = "Medium", italic = true })
  --   },
  --   {
  --     intensity = 'Normal',
  --     italic = true,
  --     font = font_with_fallback(fontname, { weight = "Light", italic = true })
  --   },
  --
  --   {
  --     intensity = 'Half',
  --     italic = true,
  --     font = font_with_fallback(fontname, {weight = "Light", italic = true}),
  --   },
  -- },

  force_reverse_video_cursor = true,
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

  keys = {
    {key="Backspace", mods="CTRL", action=wezterm.action{SendKey={key="w", mods="CTRL"}}},
    {key="/", mods="CTRL", action=wezterm.action{SendKey={key="_", mods="CTRL"}}},
  },



  -- debug_key_events = true,

  -- font_size = 11.3,
  -- font_size = 10.4,
  font_size = 9.3,
  font_rasterizer = "FreeType",
  bold_brightens_ansi_colors = true,
  -- line_height = 1.6,
  line_height = 1.54,
  -- foreground_text_hsb = {
  --   hue = 1.0,
  --   saturation = 1.0,
  --   brightness = 0.7,  -- default is 1.0
  -- },

  -- freetype_load_target = "HorizontalLcd",
  -- color_schemes = {
  --   ["Tinacious Design (Dark)"] = scheme,
  -- },
  use_fancy_tab_bar = false,
  enable_tab_bar = false,

  background = {
    {
      source = {
        Color = '#101017',
      },
      height = '100%',
      width = '100%',
    },
    {
      source = {
        File = "/home/tknightz/Downloads/Pictures/bg_21.png",
      },
      -- hsb = {
      --   brightness = 0.05,
      --   saturation = 0.8,
      -- },
      opacity = 0.035,
      vertical_align = "Middle",
    }
  },

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- window_background_opacity = 1.0,
  default_cursor_style = "BlinkingBar",
  initial_rows = 23,
  initial_cols = 140,

  audible_bell = "Disabled",

  front_end = "WebGpu",
  webgpu_preferred_adapter = gpus[2],
}
