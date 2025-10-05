local status_ok, restClient = pcall(require, "rest-nvim")

if not status_ok then
	return
end

restClient.setup()
