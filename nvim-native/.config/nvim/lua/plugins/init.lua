local pack = vim.pack

local function require_all(dir)
	local mods = {}
	local base = vim.fn.stdpath("config") .. "/lua/" .. dir:gsub("%.", "/")
	for name, type_ in vim.fs.dir(base) do
		if type_ == "file" and name:match("%.lua$") and name ~= "init.lua" then
			local mod = require(dir .. "." .. name:gsub("%.lua$", ""))
			table.insert(mods, mod)
		end
	end
	return mods
end

local modules = require_all("plugins")

local specs = {}
for _, m in ipairs(modules) do
	table.insert(specs, {
		src = m.src,
		name = m.name,
		version = m.version,
	})
end

pack.add(specs)

for _, m in ipairs(modules) do
	if type(m.setup) == "function" then
		m.setup()
	end
end
