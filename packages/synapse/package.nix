{ pkgs, ... }:

{
    services.postgresql.enable = true;
    services.postgresql.initialScript = pkgs.writeText "synapse-init" ''
        CREATE ROLE "matrix-synapse" WITH LOGIN PASSWORD 'synapse';
        CREATE DATABASE "matrix-synapse" WITH OWNER "matrix-synapse"
            TEMPLATE template0
            LC_COLLATE = "C"
            LC_CTYPE = "C";
    '';

    services.matrix-synapse = {
        enable = true;
        settings.server_name = "dirae.org";

        settings.listeners = [
            {
                port = 8008;
                bind_addresses = [ "127.0.0.1" ];
                type = "http";
                tls = false;
                x_forwarded = true;
                resources = [{
                    names = [ "client" "federation" ];
                    compress = true;
                }];
            }
        ];
    };
}
