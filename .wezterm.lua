-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28
-- Spawn a fish shell in login mode
config.default_prog = { 'pwsh.exe' }
-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'AdventureTime'
--config.font = wezterm.font 'Fira Code'
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
--config.font =  wezterm.font('JetBrains Mono', { weight = 'Medium', italic = false })
config.font =  wezterm.font('CaskaydiaCove NFM', { weight = 'Medium', italic = false })

-- Finally, return the configuration to wezterm:
return config