# nixos-config

This repository contains flake-based NixOS configurations. Each host is declared under `nixosConfigurations` in the flake and can be built or applied via `nixos-rebuild`.

## Building and applying

From the repository root run:

```bash
sudo nixos-rebuild switch --flake .#<hostname> --no-write-lock-file
```

Remote usage (no local checkout):

```bash
sudo nixos-rebuild switch --flake github:lennihein/nixos-config#<hostname> --no-write-lock-file
```

Replace `<hostname>` with one of the hosts defined in `flake.nix` (`dell` or `ptah`).

## home-manager

The flake includes the [home-manager](https://github.com/nix-community/home-manager) input. User profiles are defined in the `home-manager-config` input referenced from this repository.

## Hardware configuration

Host-specific hardware settings live under `hosts/<hostname>/hardware-configuration.nix` and are imported in `flake.nix` for each system.
