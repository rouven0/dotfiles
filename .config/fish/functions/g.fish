function g -d 'git shortcuts'
	git (echo diff\nstatus\ncommit\npush\npull\nlog | fzf --prompt "git ")
end
