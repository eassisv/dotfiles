local M = {}
local unpack_fn = unpack or table.unpack

function M.require_mod_fn(mod, fn, ...)
	local vararg = { ... }
	return function()
		require(mod)[fn](unpack_fn(vararg))
	end
end

M.unpack_fn = unpack_fn

return M
