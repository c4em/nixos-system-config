{ ... }:

{
    services.deluge = {
        enable = true;
        user = "media";
        declarative = true;
        dataDir = "/mnt/mass/Services/Deluge";
        authFile = "/mnt/mass/Services/Deluge/auth";

        config = {
            download_location = "/mnt/mass/Torrents/incomplete";
            move_completed_path = "/mnt/mass/Torrents";
            move_completed = true;
            listen_random_port = false;
            outgoing_interface = "wg0";
            listen_interface = "wg0";
            allow_remote = true;
            listen_ports = [ 57597 ];
            max_active_seeding = 0;
            max_active_downloading = 5;
            max_active_limite = 0;
        };
    };

    networking.firewall.allowedTCPPorts = [ 57597 58846 ];
}
