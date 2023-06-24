{ ... }:

{
    imports = [
        ./hardware/qemu-vm.nix
        ../sets/meta/sysadmin.nix
        ../packages/vim/package.nix
        ./common.nix
        ./persist/qemu-vm.nix
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";

    networking.hostId = "e78229f8";

    time.timeZone = "Europe/Berlin";
}
