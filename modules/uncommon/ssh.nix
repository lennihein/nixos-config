{ config, pkgs, ... }:
{
    # Enable the OpenSSH daemon.
    services.openssh = {
        enable = false;
        settings = {
            X11Forwarding = true;
            GatewayPorts = "yes";
            PasswordAuthentication = false;
            PermitRootLogin = "no";
            KbdInteractiveAuthentication = false;
        };
    };
}
