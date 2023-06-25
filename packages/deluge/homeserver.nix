{ ... }:

{
    services.deluge = {
        enable = true;
        user = "media";
        declarative = true;
        dataDir = "/mnt/mass/Services/Deluge";
        authFile = "/mnt/mass/Services/Deluge/auth";

        config = {
            download_location = "/mnt/mass/Torrents";
            allow_remote = true;
            listen_ports = [ 57597 ];
        };
    };

    networking.firewall.allowedTCPPorts = [ 57597 58846 ];
}
