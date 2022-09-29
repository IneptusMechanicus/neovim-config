require('bufferline').setup({
	options = {
		hover = {
			enabled = true,
			delay = 200
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "Files",
				highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			}
		},
		separator_style = "slant",
		close_command = "Bdelete! %d"
	}
})