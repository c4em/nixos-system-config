{ ... }:

{
    imports = [
        ./common.nix
        ./hardware/homeserver.nix
        ./persist/homeserver.nix
        ../sets/meta/sysadmin.nix
        ../packages/vim/package.nix
        ../packages/nginx/homeserver.nix
        ../packages/syncthing/homeserver.nix
    ];

    boot = {
        loader = {
            efi = {
                canTouchEfiVariables = true;
            };
            grub = {
                enable = true;
                efiSupport = true;
                device = "nodev";
            };
        };

        kernel = {
            sysctl."net.ipv6.conf.eth0.disable_ipv6" = true;
        };
    };

    networking = {
        hostName = "homeserver";
        enableIPv6 = false;
        hostId = "95f846dc";
        interfaces = {
            eno1.ipv4.addresses = [{
                address = "192.168.2.69";
                prefixLength = 24;
            }];
        };
        nameservers = [ "1.1.1.1" "8.8.8.8" ];
        defaultGateway = "192.168.2.1";
        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 ]; 
        };
    };

    time.timeZone = "Europe/Berlin";

    console.keyMap = "uk";

    # To not mess up SSH sessions from weird terminals
    environment.sessionVariables = rec {
        TERM = "xterm";
    };
}
