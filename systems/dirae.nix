{ ... }:

{
    imports = [
        ./common.nix
        ./hardware/dirae.nix
#        ./persist/dirae.nix
        ../sets/meta/sysadmin.nix
	    ../packages/vim/package.nix
        ../packages/sshd/package.nix
        ../packages/mailserver/package.nix
        ../packages/nginx/dirae.nix
        ../packages/gitlab/package.nix
        ../packages/synapse/package.nix
    ];

    boot = {
        loader = {
            grub = {
                enable = true;
                device = "/dev/vda";
            };
        };

        kernel = {
            sysctl."net.ipv6.conf.eth0.disable_ipv6" = true;
        };
    };

    networking = {
        hostName = "dirae";
        enableIPv6 = false;
        hostId = "149e5b5c";
        interfaces = {
            enp6s18.ipv4.addresses = [{
                address = "91.210.224.148";
                prefixLength = 24;
            }];
        };
        nameservers = [ "1.1.1.1" "8.8.8.8" ];
        defaultGateway = "91.210.224.1";
        firewall = {
            enable = true;
        };
    };

    time.timeZone = "Europe/Berlin";

    # To not mess up SSH sessions from weird terminals
    environment.sessionVariables = {
        TERM = "xterm";
    };
}

