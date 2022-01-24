function sn -d 'Activate a network connection'
	sudo nmcli connection up (nmcli connection show | tail -n +2 | cut -d " " -f1 | fzf)
end
