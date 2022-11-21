{ config, pkgs, ... }:

{
	# Home Manager needs a bit of information about you and the
	# paths it should manage.
	home.username = "rouven";
	home.homeDirectory = "/home/rouven";

	home.packages = with pkgs; [
		# essentials
		alacritty
		networkmanagerapplet
		pcmanfm
		vifm # maybe we can get this done the nix way
		xsel
		ulauncher
		lightlocker

		# graphics
		lxappearance
		feh
		flameshot
		picom
		okular
		gimp

		# editing
		fzf
		powerline-fonts

		# sound
		pavucontrol
		volumeicon
		yadm

		# internet
		thunderbird
		discord
		google-chrome
		nextcloud-client

		# messaging
		tdesktop
		element-desktop
		whatsapp-for-linux

		# games
		minecraft
		superTuxKart

		# yubikey and password stuff
		yubikey-manager
		yubikey-manager-qt
		yubioath-desktop
		pass
		qtpass

		# misc
		neofetch
		trash-cli
		
	];

	programs.git = {
		enable = true;
		userName = "Rouven Seifert";
		userEmail = "rouven@rfive.de";
		extraConfig = {
			user.signingkey = "B95E8FE6B11C4D09";
			pull.rebase = false;
			init.defaultBranch = "main";
			commit.gpgsign = true;
		};

	};
 

	programs.zsh = {
		enable = true;
		shellAliases = {
			rm = "trash";
		};
		history = {
			size = 10000;
			path = "${config.xdg.dataHome}/zsh/history";
		};

		oh-my-zsh = {
			enable = true;
			# plugins = [ "zsh-autosuggestions" "fzf-tab"  ];
			theme="agnoster";
		};

		plugins = [
			{
				name = "zsh-autosuggestions";
				src = pkgs.fetchFromGitHub {
					owner = "zsh-users";
					repo = "zsh-autosuggestions";
					rev = "v0.7.0";
					sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
				};
			}
			{
				name = "fzf-tab";
				src = pkgs.fetchFromGitHub {
					owner = "Aloxaf";
					repo = "fzf-tab";
					rev = "14f66e4d3d0b366552c0412eb08ca9e0f7c797bd";
					sha256 = "YkfHPSuSKParz7JidR924CJSuXO6Rk0RZTlxPOBwLJk=";
				};
			}
		];

		localVariables = {
			COMPLETION_WAITING_DOTS="true";
			ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00bbbb,bold";
			# ZSH_AUTOSUGGEST_STRATEGY="(history completion)";
		};

		initExtra = 
		''
			function c() {
				cd
				if [ $# -eq 0 ]; then
					cd $(find -maxdepth 4 -not -path '*[cC]ache*' -not -path '*[tT]rash*' -type d | fzf --preview 'tree -C {}')
				else
					$1 $(find -maxdepth 5 -not -path '*[cC]ache*' -not -path '*[tT]rash*' | fzf --preview 'tree -C {}')
				fi
			}
			
			function sn() {
				nmcli connection up $(nmcli connection show | tail -n +2 | cut -d " " -f1 | fzf --preview 'nmcli connection show {}')
			}
			
			prompt_dir() {
				prompt_segment blue $CURRENT_FG '%c'
			}
		'';
	};

	programs.tmux = {
		enable = true;
		keyMode = "vi";
		terminal = "tmux-256color";
		clock24 = true;
		extraConfig =
		''
			set -g default-shell /home/rouven/.nix-profile/bin/zsh
			bind P display-popup
		'';
		plugins = with pkgs.tmuxPlugins; [
			{
				plugin = dracula;
				extraConfig = ''
					set -g @dracula-show-fahrenheit false
					set -g @dracula-plugins "weather time"
					set -g @dracula-show-left-icon session
					set -g @dracula-show-powerline true
				'';
			}
		];
	};

	services.picom = {
		enable = true;
	};


	# This value determines the Home Manager release that your
	# configuration is compatible with. This helps avoid breakage
	# when a new Home Manager release introduces backwards
	# incompatible changes.
	#
	# You can update Home Manager without changing this value. See
	# the Home Manager release notes for a list of state version
	# changes in each release.
	home.stateVersion = "22.05";

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
