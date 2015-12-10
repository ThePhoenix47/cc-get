function load(path, _env)
	--load a configuration file, given a fully-resolved path and an optional environment.
	if not fs.exists(path) or fs.isDir(path) then return nil, "not a file" end
	local env
	if not _env then
		--if we were not provided an environment, create one.
		env = setmetatable({}, {__index = _G})
	else
		env = _env
	end
	local fn, err = loadfile(path)
	if fn then
		setfenv(fn, env)
		local success, err = pcall(fn)
		if success then
			--strip the metatable from the environment before returning it.
			return setmetatable(env, {})
		else
			return nil, err
		end
	else
		return nil, err
	end
end

function save(path, config)
	if not config or type(config) ~= "table" then return nil, "Not a configuration" end
	local handle = io.open(path, "w")
	if handle then
		for k, v in pairs(config) do
			local success, str = pcall(textutils.serialize(v))
			if success then
				handle:write(k.." = "..str.."\n\n")
			end
		end
		handle:close()
	else
		return nil, "Could not write configuration."
	end
end