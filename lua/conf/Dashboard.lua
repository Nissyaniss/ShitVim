local db = require("dashboard")

db.setup({
	theme = 'hyper',
	config = {
		header = {
			"",
			"",
			"",
			"",
			"   _____ __    _ __ _    ___         ",
			"  / ___// /__ (_) /| |  / (_)___ ___ ",
			" \\__  / __  / / __/ | / / / __ `__ \\",
			" ___/ / / / / / /_ | |/ / / / / / / /",
			"/____/_/ /_/_/\\__/ |___/_/_/ /_/ /_/ ",
			"",
			"",
			"",
		},
		shortcut = {
			{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
			{
				desc = ' Neovim config',
				action = "e /home/nissya/.config/nvim/ | cd /home/nissya/.config/nvim",
				key = 'n',
			},
			{
				desc = ' Hyprland config',
				action = "e /home/nissya/.config/hypr/ | cd /home/nissya/.config/hypr",
				key = 'h',
			},
			{
				desc = ' Cours',
				action = "e /home/nissya/Cours | cd /home/nissya/Cours",
				key = 'c',
			},
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
		},
		footer = {
			"",
			"Go fuck yourself"
		}
	},
})
