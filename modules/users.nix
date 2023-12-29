
  { config, pkgs, ... }:
  # add users for separation
  {
    users.users.dnd = {
      isNormalUser = true;
      description = "DND";
      extraGroups = [ "networkmanager" ];
      packages = with pkgs; [
        pkgs.zettlr
      ];
    };

    users.users.schule = {
      isNormalUser = true;
      description = "Schule";
      extraGroups = [ "networkmanager" "wheel"];
      packages = with pkgs; [
      ];
    };
  }
