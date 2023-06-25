{ ... }:

{
    services.nginx.enable = true;
    services.nginx.virtualHosts."192.168.2.69" = {
        root = "/mnt/mass/Torrents";
        extraConfig = ''
            autoindex on;
        '';
    };

    networking.firewall.allowedTCPPorts = [ 80 ];
}
