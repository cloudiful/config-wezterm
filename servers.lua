local module = {}

function module.apply(config)
	config.ssh_domains = {
		{
			name = "nas",
			remote_address = "inet.cloudiful.cn",
			username = "root",
		},
	}
end

return module
