{ config, pkgs, ... }:
{
  # Enable networking through NetworkManager
  networking.networkmanager.enable = true;

  # Install dig for nslookup and Mullvad VPN GUI
  environment.systemPackages = [pkgs.mullvad-vpn pkgs.dig];
  # enable mullvad VPN
  services.mullvad-vpn.enable = true;


  # Configure systemd-resolved
  networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    extraConfig = ''
      DNSOverTLS=yes
    '';
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
