return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				qmlls = {
					mason = false,
					cmd = { "/usr/bin/qmlls6" },
					filetypes = { "qml", "qmljs" },
				},
			},
		},
	},
}
