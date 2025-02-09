{ config, pkgs, ... }:
{
  programs.wireshark.enable = true;
  users.users.lenni.extraGroups = [ "wireshark" ];
}
