{ config, pkgs, ... }:
{
  services.displayManager.gdm.wayland = false;
}
