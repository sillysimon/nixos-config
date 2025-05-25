# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # include desktop environments
      ./modules/gnome.nix
      ./modules/plasma.nix
      # add system config
      ./modules/users.nix
      ./modules/networking.nix
      # include modules configuring certain apps
      ./modules/code.nix
      ./modules/productivity-apps.nix
      ./modules/3d_printing.nix
      ./modules/multimedia.nix
      ./modules/environment.nix
      ./modules/virtualization.nix
      # You might need to restart your computer after setup for audio to work after enabling this
      ./modules/bluetooth-audio.nix
      
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "simyoga"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";



  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Exclude xterm
  services.xserver.excludePackages = [ pkgs.xterm ];
  
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "de";
    xkb.variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.spacenavd.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Set the default Display Manager
  services.xserver.displayManager.gdm.enable = true;

  # add a fix for conflicting askpass configs
  # https://github.com/NixOS/nixpkgs/issues/75867
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
    
  # set default session to kde wayland
  services.displayManager.defaultSession = "plasma";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simon = {
    isNormalUser = true;
    description = "Simon Waidele";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" "qemu" "cdrom" ];
    packages = with pkgs; [
      firefox
      teamspeak_client
    #  thunderbird
    ];
  };

  #activate the integrated modem of the laptop
  networking.modemmanager.fccUnlockScripts = [{ id = "1199:9079"; path = "${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/1199:9079"; }];

  # Enable automatic login for the user.
  #services.xserver.displayManager.autoLogin.enable = true;
  #services.xserver.displayManager.autoLogin.user = "simon";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak for even more Applications
  services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # ATTENTION: PLEASE PUT PACKAGES IN SEPARATE MODULES
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  #networking.firewall.allowedTCPPorts = [ 8080 ];
  #networking.firewall.allowedUDPPorts = [ 8080 ];

  # List services that you want to enable:

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
