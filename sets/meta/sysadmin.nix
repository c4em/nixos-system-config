{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        htop
        wget
        curl
        git
    ];

    services.openssh.enable = true;
}
