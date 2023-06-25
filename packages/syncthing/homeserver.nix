{ ... }:

{
    imports = [
        ../../users/media.nix
    ];

    services.syncthing = {
        enable = true;
        user = "media";
        dataDir = "/mnt/mass";
        configDir = "/mnt/mass/Services/Syncthing";
        guiAddress = "0.0.0.0:8384";
    };

    networking.firewall.allowedTCPPorts = [ 8384 22000 ];
    networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
