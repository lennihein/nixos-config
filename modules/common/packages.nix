{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # essentials
        wget
        lsof dig file
        atool unzip
        python3
        
        # command line tools 
        htop bottom gdu neofetch ranger tldr gitui bat fzf ripgrep pwndbg rm-improved eza nvd direnv procs fd duf
    ];
    programs.fish.enable = true;
    programs.vim = {
      defaultEditor = true;
      enable = true;
    };
    programs.git.enable = true;
    programs.dconf.enable = true;

    # Register fish as a shell
    environment.shells = with pkgs; [ fish ];
}
