{ config, pkgs, ... }:
{
  users.users.lenni = {
    isNormalUser = true;
    description = "Lenni Hein";
    extraGroups = [ "networkmanager" "wheel"];
    shell = pkgs.fish;
  };
}
