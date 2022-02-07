require("sidebar-nvim").setup({
	sections = { "git", "diagnostics", "containers", "todos" },
	todos = {
		icon = "",
		ignored_paths = { "~" }, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
		initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
	},
	containers = {
		icon = "",
		use_podman = false,
		attach_shell = "pwsh",
		show_all = true, -- whether to run `docker ps` or `docker ps -a`
		interval = 5000, -- the debouncer time frame to limit requests to the docker daemon
	},
})
