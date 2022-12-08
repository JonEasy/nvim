local status_ok, project_nvim = pcall(require, "project_nvim")
if not status_ok then
	return
end
require("project_nvim").setup({})
