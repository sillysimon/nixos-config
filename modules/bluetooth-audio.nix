{ config, pkgs, ... }:
{
  #used https://nixos.wiki/wiki/PipeWire
  #This module adds bluetooth support.
  #It also breaks every other non-bluetooth sink
  #I don't know why ¯\_ (ツ)_/¯
  
  # if that happens, try restarting your computer, that fixed it for me
  environment.etc = {
	"wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
		bluez_monitor.properties = {
			["bluez5.enable-sbc-xq"] = true,
			["bluez5.enable-msbc"] = true,
			["bluez5.enable-hw-volume"] = true,
			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
		}
	'';
  };
}