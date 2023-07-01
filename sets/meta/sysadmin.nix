{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        htop
        wget
        curl
        git
        tree
    ];

    services.openssh.enable = true;
}
