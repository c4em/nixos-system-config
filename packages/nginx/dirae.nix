{ ... }:
let
    fqdn = "dirae.org";
    serverConfig."m.server" = "dirae.org:443";
    mkWellKnown = data: ''
        add_header Content-Type application/json;
        add_header Access-Control-Allow-Origin *;
        return 200 '${builtins.toJSON data}';
    '';
in {
    security.acme.acceptTerms = true;
    security.acme.defaults.email = "caem@dirae.org";
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    services.nginx = {
        enable = true;
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;

        virtualHosts = {
            "dirae.org" = {
                enableACME = true;
                forceSSL = true;
                locations."/" = {
                    root = "/var/www/dirae";
                };
                locations."/.well-known/matrix/server".extraConfig = ''
                    return 200 '{"m.server": "dirae.org:443"}';
                    default_type application/json;
                    add_header Access-Control-Allow-Origin *;
                '';
                locations."/_matrix".proxyPass = "http://127.0.0.1:8008";

            };

            "gitlab.dirae.org" = {
                enableACME = true;
                forceSSL = true;
                locations."/" = {
                    proxyPass = "http://unix:/run/gitlab/gitlab-workhorse.socket";
                };

             };
        };
    };
}
