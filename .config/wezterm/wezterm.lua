local wezterm = require 'wezterm';
local font_name = "Operator Mono for Powerline"


function convert_params(params)
  local weight_converter = {
    Regular = "Regular",
    Book = "Medium",
    Medium = "Medium",
    Bold = "Bold",
  }

  return {
    weight = weight_converter[params.weight],
    italic = params.italic
  }
end

function font_with_fallback(name, params)
  local names = {name, "IBM Plex Mono", "Symbols Nerd Font Mono"}
  return wezterm.font_with_fallback(names, convert_params(params))
end

return {
  font = wezterm.font_with_fallback({
    {family=font_name, weight="Book"},
  }),
  font_size = 12.5,
  line_height = 1.2,

  font_rules = {
    {
      italic = false,
      intensity = "Bold",
      font = font_with_fallback(font_name, {weight="Medium", italic=false})
    },
    {
      italic = true,
      intensity = "Normal",
      font = font_with_fallback(font_name, {weight="Book", italic=true})
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback(font_name, {weight="Medium", italic=true})
    },
  },

  
  colors = {
    cursor_bg = "#54FF71",
    foreground = "#ada4c0",
    background = "#121212",
    cursor_border = "#bbbbbb",
    cursor_fg = "#000000",
    selection_bg = "#453b39",
    selection_fg = "#b6bbc0",
    ansi = {"#1b1d1e","#f92672","#a6e22e","#fd971f","#57c7ff","#9e6ffe","#5e7175","#ccccc6"},
    brights = {"#505354","#ff669d","#beed5f","#e6db74","#66d9ef","#9e6ffe","#a3babf","#f8f8f2"}
  },
  cursor = "bar",

  -- Window config
  initial_cols = 150,
  initial_rows = 38,

  enable_tab_bar = false,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  window_background_image = "/home/tknightz/Pictures/uchiha-bg.jpg",

  window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
      brightness = 0.2,

    -- You can adjust the hue by scaling its value.
      -- a multiplier of 1.0 leaves the value unchanged.
      hue = 1.0,

    -- You can adjust the saturation also.
      saturation = 1.0,
  },

  -- Input keyboard
  use_ime = true,
}
