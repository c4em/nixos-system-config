{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        htop
        wget
        curl
    ];

    services.openssh.enable = true;
}
