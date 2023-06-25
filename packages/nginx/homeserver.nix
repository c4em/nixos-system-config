{ ... }:

{
    services.nginx = {
        enable = true;
        user = "media";
        virtualHosts."192.168.2.69" = {
            root = "/mnt/mass/Torrents";
            extraConfig = ''
                autoindex on;
            '';
        };
    };

    networking.firewall.allowedTCPPorts = [ 80 ];
}
