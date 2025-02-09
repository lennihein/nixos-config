{ config, pkgs, ... }:
{
  # NerdFonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.iosevka
  ];
}
