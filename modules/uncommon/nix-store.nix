{ config, pkgs, ... }:
{
  # Dedupe the Nix store
  nix.settings.auto-optimise-store = true;

  # Garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "*-*-* 4:00:00";
  # without options it will only clean the store, not delete old generations
  nix.gc.options = "--delete-older-than 14d";
}
