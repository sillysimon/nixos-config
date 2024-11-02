simyoga:
	sudo ./load_config.sh simyoga
simtab:
	sudo ./load_config.sh simtab
update:
	nix flake update .
	git add flake.lock
	git commit -m "updated system"
	git push
clean:
	sudo nix-collect-garbage --delete-older-than 100d
