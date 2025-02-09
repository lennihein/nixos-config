{ config, pkgs, ... }:
{
    # virtualisation
    virtualisation.podman.enable = true;
    virtualisation.libvirtd.enable = true;
    environment.systemPackages = with pkgs; [
        virtiofsd
    ];
    users.users.lenni.extraGroups = [ "libvirt" "docker" ];
}
