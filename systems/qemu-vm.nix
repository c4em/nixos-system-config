{ config, pkgs, ... }:

{
    imports = [
        ../sets/meta/sysadmin.nix
        ../packages/vim/package.nix
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";

    time.timeZone = "Europe/Berlin";
}
