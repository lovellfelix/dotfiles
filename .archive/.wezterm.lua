-- local wezterm = require ('wezterm');

-- local config = wezterm.config_builder()

-- -- Slightly transparent and blurred background
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 30

-- config.color_scheme = 'Catppuccin Macchiato'
-- config.font = wezterm.font("JetBrainsMono Nerd Font")

-- config.font_size = 16.0

-- -- Sets the font for the window frame (tab bar)
-- config.window_frame = {
--   -- Berkeley Mono for me again, though an idea could be to try a
--   -- serif font here instead of monospace for a nicer look?
--   font = wezterm.font({ family = 'JetBrainsMono Nerd Font', weight = 'Bold' }),
--   font_size = 11,
-- }

-- config.enable_tab_bar = true
-- -- config.window_decorations =  "RESIZE | TITLE"
-- config.window_decorations = "RESIZE"


-- wezterm.on('update-status', function(window)
--   -- Grab the utf8 character for the "powerline" left facing
--   -- solid arrow.
--   local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

--   -- Grab the current window's configuration, and from it the
--   -- palette (this is the combination of your chosen colour scheme
--   -- including any overrides).
--   local color_scheme = window:effective_config().resolved_palette
--   local bg = color_scheme.background
--   local fg = color_scheme.foreground

--   window:set_right_status(wezterm.format({
--     -- First, we draw the arrow...
--     { Background = { Color = 'none' } },
--     { Foreground = { Color = bg } },
--     { Text = SOLID_LEFT_ARROW },
--     -- Then we draw our text
--     { Background = { Color = bg } },
--     { Foreground = { Color = fg } },
--     { Text = ' ' .. wezterm.hostname() .. ' ' },
--   }))
-- end)

-- -- Table mapping keypresses to actions
-- config.keys = {
--   -- Sends ESC + b and ESC + f sequence, which is used
--   -- for telling your shell to jump back/forward.
--   {
--     -- When the left arrow is pressed
--     key = 'LeftArrow',
--     -- With the "Option" key modifier held down
--     mods = 'OPT',
--     -- Perform this action, in this case - sending ESC + B
--     -- to the terminal
--     action = wezterm.action.SendString '\x1bb',
--   },
--   {
--     key = 'RightArrow',
--     mods = 'OPT',
--     action = wezterm.action.SendString '\x1bf',
--   },
-- }

-- config.keys = {
--   -- ... add these new entries to your config.keys table
--   {
--     key = ',',
--     mods = 'SUPER',
--     action = wezterm.action.SpawnCommandInNewTab {
--       cwd = wezterm.home_dir,
--       args = { 'nvim', wezterm.config_file },
--     },
--   },
-- }

-- config.set_environment_variables = {
--   PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
-- }

-- local project_dir = wezterm.home_dir .. "~/projects"

-- local function project_dirs()
--   -- Start with your home directory as a project, 'cause you might want
--   -- to jump straight to it sometimes.
--   local projects = { wezterm.home_dir }

--   -- WezTerm comes with a glob function! Let's use it to get a lua table
--   -- containing all subdirectories of your project folder.
--   for _, dir in ipairs(wezterm.glob(project_dir .. '/*')) do
--     -- ... and add them to the projects table.
--     table.insert(projects, dir)
--   end

--   return projects
-- end


-- -- local act                           = wezterm.action

-- -- local mod                           = {
-- --     SUPER = "SUPER",
-- --     SUPER_REV = 'SUPER|SHIFT',
-- --     OPT = 'OPT',
-- -- }

-- -- config.leader                       = { key = 'a', mods = 'CTRL' }
-- -- config.mouse_bindings               = {
-- --     {
-- --         event = { Up = { streak = 1, button = 'Left' } },
-- --         mods = mod.SUPER,
-- --         action = act.OpenLinkAtMouseCursor,
-- --     },
-- -- }
-- -- config.key_tables                   = {
-- --     resize_pane = {
-- --         { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
-- --         { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
-- --         { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
-- --         { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
-- --         { key = 'Escape', action = 'PopKeyTable' },
-- --         { key = 'q',      action = 'PopKeyTable' },
-- --     },
-- -- }

-- -- config.keys                         = {
-- --     -- panes: split panes
-- --     {
-- --         key = [[\]],
-- --         mods = mod.SUPER,
-- --         action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
-- --     },
-- --     {
-- --         key = [[\]],
-- --         mods = mod.SUPER_REV,
-- --         action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
-- --     },


-- --     -- panes: zoom+close pane
-- --     { key = 'Enter', mods = mod.SUPER, action = act.TogglePaneZoomState },
-- --     { key = 'w',     mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

-- --     -- panes: navigation
-- --     { key = 'k',     mods = 'LEADER',  action = act.ActivatePaneDirection('Up') },
-- --     { key = 'j',     mods = 'LEADER',  action = act.ActivatePaneDirection('Down') },
-- --     { key = 'h',     mods = 'LEADER',  action = act.ActivatePaneDirection('Left') },
-- --     { key = 'l',     mods = 'LEADER',  action = act.ActivatePaneDirection('Right') },

-- --     -- panes: resize_pane
-- --     {
-- --         key = 'p',
-- --         mods = 'LEADER',
-- --         action = act.ActivateKeyTable({
-- --             name = 'resize_pane',
-- --             one_shot = false,
-- --             timemout_miliseconds = 1000,
-- --         }),
-- --     },

-- --     {
-- --         key = 'p',
-- --         mods = mod.SUPER,
-- --         action = act.ActivateCommandPalette
-- --     },
-- --     {
-- --         key = 'u',
-- --         mods = mod.SUPER,
-- --         action = wezterm.action.QuickSelectArgs({
-- --             label = 'open url',
-- --             patterns = {
-- --                 '\\((https?://\\S+)\\)',
-- --                 '\\[(https?://\\S+)\\]',
-- --                 '\\{(https?://\\S+)\\}',
-- --                 '<(https?://\\S+)>',
-- --                 '\\bhttps?://\\S+[)/a-zA-Z0-9-]+'
-- --             },
-- --             action = wezterm.action_callback(function(window, pane)
-- --                 local url = window:get_selection_text_for_pane(pane)
-- --                 wezterm.log_info('opening: ' .. url)
-- --                 wezterm.open_with(url)
-- --             end),
-- --         }),
-- --     },

-- --     -- tabs: navigation
-- --     { key = '[', mods = mod.SUPER,     action = act.ActivateTabRelative(-1) },
-- --     { key = ']', mods = mod.SUPER,     action = act.ActivateTabRelative(1) },
-- --     { key = '[', mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
-- --     { key = ']', mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

-- --     {
-- --         key = ',',
-- --         mods = mod.OPT,
-- --         action = wezterm.action_callback(function(window, pane)

-- --             local wez_config_path = os.getenv('HOME') .. '/.config/wezterm/wezterm.lua'
-- --             wezterm.log_info('wez config' .. wez_config_path)
-- --             window:perform_action(
-- --                 wezterm.action.SpawnCommandInNewTab {
-- --                     args = { 'nvim', wez_config_path },
-- --                     set_environment_variables = {
-- --                         PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
-- --                     },
-- --                 },
-- --                 pane
-- --             )
-- --         end),
-- --     },

-- --     -- copy mode
-- --     { key = 'Enter', mods = mod.SUPER_REV, action = 'ActivateCopyMode' },
-- return config
