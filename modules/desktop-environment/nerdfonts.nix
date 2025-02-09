{ config, pkgs, ... }:
{
  # NerdFonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka"]; })
  ];
}
