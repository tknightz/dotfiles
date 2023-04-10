local wezterm = require 'wezterm';
local fontname = "Operator Mono SSm Lig Medium";


local scheme = wezterm.get_builtin_color_schemes()["Tinacious Design (Dark)"]
scheme.cursor_bg = "#00afff"
scheme.cursor_fg = "#000000"
scheme.cursor_border = "#00afff"

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
    { family = "Symbols Nerd Font Mono", scale = 0.8 },
    { family = "FiraMono Nerd Font", scale = 0.8 }
  }
  return wezterm.font_with_fallback(names, params)
end

return {
  font = font_with_fallback(fontname, { weight = "Medium" }),
  font_rules = {
    {
      intensity = 'Bold',
      italic = false,
      font = font_with_fallback(fontname, { weight = 'Bold' })
    },
    {
      intensity = 'Bold',
      italic = true,
      font = font_with_fallback(fontname, { weight = "Bold", italic = true })
    },
    {
      intensity = 'Normal',
      italic = true,
      font = font_with_fallback(fontname, { weight = "DemiLight", italic = true })
    },

    {
      intensity = 'Half',
      italic = true,
      font = font_with_fallback(fontname, {weight = 'Light', italic = true}),
    },
  },

  keys = {
    {key="Backspace", mods="CTRL", action=wezterm.action{SendKey={key="w", mods="CTRL"}}},
  },



  -- debug_key_events = true,

  font_size = 11.3,
  line_height = 1.45,
  color_schemes = {
    ["Tinacious Design (Dark)"] = scheme,
  },
  color_scheme = "Tinacious Design (Dark)",
  use_fancy_tab_bar = false,
  enable_tab_bar = false,

  background = {
    {
      source = {
        File = "./backgroundimgs/bg_21.jpg",
      },
      hsb = {
        brightness = 0.025,
      },
      vertical_align = "Middle",
    }
  },

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_background_opacity = 1.0,
  default_cursor_style = "BlinkingBar",
  initial_rows = 24,
  initial_cols = 150,

  -- force_reverse_video_cursor = true,
  -- colors = {
  --   foreground = "#dcd7ba",
  --   background = "#1f1f28",
  --
  --   cursor_bg = "#c8c093",
  --   cursor_fg = "#c8c093",
  --   cursor_border = "#c8c093",
  --
  --   selection_fg = "#c8c093",
  --   selection_bg = "#2d4f67",
  --
  --   scrollbar_thumb = "#16161d",
  --   split = "#16161d",
  --
  --   ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  --   brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  --   indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  -- },
}
