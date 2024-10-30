local M = {}

local default_config = {
	-- The engine to be used under normal mode.
	normal_engine = "xkb:us::eng",
	-- The engine to be automatically switched to when enters insert mode.
	default_engine = "xkb:us::eng",
	-- Memorize the last active engine under insert mode if `true`,
	-- overrides the default engine.
	enable_memory = true,
}

local config
local memory

local function switch_engine()
	local mode = vim.v.event.new_mode
	if mode:sub(1, 1) == "i" then
		vim.system({ "ibus", "engine", memory })
	else
		if config.enable_memory then
			-- Remove the trailing newline.
			memory = vim.system({ "ibus", "engine" })
				:wait()
				.stdout
				:sub(1, -2)
		end
		vim.system({ "ibus", "engine", config.normal_engine })
	end
end

function M.setup(opts)
	config = vim.tbl_extend("keep", opts or {}, default_config)
	memory = config.default_engine
	vim.api.nvim_create_autocmd("ModeChanged", { callback = switch_engine })
end

return M
