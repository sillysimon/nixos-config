{ config, pkgs, ... }:
{
  # Enable networking through NetworkManager
  networking.networkmanager.enable = true;

  # Install dig for nslookup and Mullvad VPN GUI
  environment.systemPackages = [pkgs.mullvad-vpn pkgs.dig];
  # enable mullvad VPN
  services.mullvad-vpn.enable = true;
  # leave the option for Zerotier
  services.zerotierone.enable = false;
  # also tailscale
  services.tailscale.enable = false;


  # Configure systemd-resolved
  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  services.resolved = {
    enable = true;
    dnssec = "false";
    #dnsovertls = "false";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    #some networks (for example my school wifi) do not allow DNS over TLS
    #either comment out this line or connect through mullvad with UDP-over-TCP Obfuscation enabled
    extraConfig = ''
    '';
  };
  #enable debug output for systemd-resolved
  systemd.services.systemd-resolved = {
    overrideStrategy = "asDropin";
    serviceConfig.Environment = "SYSTEMD_LOG_LEVEL=debug";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
