local module = {}

function module.apply(config)
	config.ssh_domains = {
		{
			name = "nas",
			remote_address = "inet.cloudiful.cn",
			username = "root",
		},
		{
			name = "hk",
			remote_address = "38.207.174.214",
			username = "cloudiful",
		},
	}
end

return module
