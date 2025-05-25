{config, pkgs, ...}:
{
  # this module enables virtualization capabilities such as containers and virtual machines
  virtualisation.podman.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  environment.systemPackages = [
    ## Packages for kvm virtualization
    pkgs.qemu
    pkgs.virt-manager
    pkgs.quickemu
    ## distrobox
    pkgs.distrobox
];
}