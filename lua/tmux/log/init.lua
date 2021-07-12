local channels = require("tmux.log.channels")

local function convert(...)
	return require("tmux.log.convert").to_string(...)
end

local function log(severity, message)
	local converted = convert(message)

	channels.log(severity, converted)
end

local M = {}
function M.setup()
	channels.add("file", require("tmux.log.channels.file").write)
end

function M.debug(message)
	log("debug", message)
end

function M.information(message)
	log("information", message)
end

function M.warning(message)
	log("warning", message)
end

function M.error(message)
	log("error", message)
end

return M
