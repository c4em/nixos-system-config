{ ... }:

{
    imports = [
        ./common.nix
        ./hardware/homeserver.nix
        ./persist/homeserver.nix
        ../sets/meta/sysadmin.nix
        ../packages/vim/package.nix
    ];

    boot.loader = {
        efi = {
            canTouchEfiVariables = true;
        };
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
        };
    };

    networking = {
        hostId = "95f846dc";
        interfaces = {
            eno1.ipv4.addresses = [{
                address = "192.168.2.69";
                prefixLength = 24;
            }];
        };
    };

    time.timeZone = "Europe/Berlin";

    console = {
        keyMap = "uk";
    };
}
