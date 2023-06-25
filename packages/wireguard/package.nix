{ pkgs, ... }:

{
    networking.wg-quick.interfaces = {
        wg0 = {
            address = [ "10.174.110.32/32" ];
            dns = [ "10.128.0.1" ];
            mtu = 1320;
            privateKeyFile = "/nix/config/packages/wireguard/privkey";

            # Route local traffic through local network
            preUp = ''
                ${pkgs.unixtools.route}/bin/route add -net 192.168.2.0 netmask 255.255.255.0 metric 0 dev eno1
            '';
            postDown = ''
                ${pkgs.unixtools.route}/bin/route del -net 192.168.2.0 netmask 255.255.255.0 metric 0 dev eno1
            '';

            peers = [{
                publicKey = "PyLCXAQT8KkM4T+dUsOQfn+Ub3pGxfGlxkIApuig+hk=";
                presharedKeyFile = "/nix/config/packages/wireguard/privpsk";
                allowedIPs = [ "0.0.0.0/0" ];
                endpoint = "nl.vpn.airdns.org:1637";
                persistentKeepalive = 15;
            }];
        };
    };

    networking.firewall.allowedUDPPorts = [ 1637 ];
}
