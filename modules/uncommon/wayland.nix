{ config, pkgs, ... }:
{
  services.displayManager.gdm.wayland = true;
  # Ozone and fractional scaling
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['scale-monitor-framebuffer']
  '';
}
