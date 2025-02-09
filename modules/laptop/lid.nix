{ config, pkgs, ... }:
{    
    # ignore lid switch when on AC
    services.logind.extraConfig = ''
        HandleLidSwitchExternalPower=ignore
    '';
}