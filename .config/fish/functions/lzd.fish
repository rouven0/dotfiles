function lzd -d 'Remote tool for managing Docker containers'
	DOCKER_HOST=ssh://$argv[1] lazydocker
end
