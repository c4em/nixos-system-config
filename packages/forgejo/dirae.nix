{ pkgs, config, lib, ... }: let
    # theme = builtins.fetchurl {
    #     url = "";
    #     sha256 = "";
    # };
in
{
    # systemd.services.gitea.preStart = lib.mkAfter ''
    #     mkdir -p ${config.services.gitea.stateDir}/custom/public/css
    #     cp -f ${theme} ${config.services.gitea.stateDir}/custom/public/css/
    # '';

    services.gitea = {
        enable = true;
        package = pkgs.forgejo;
        
        appName = "git.dirae.org";
        settings = {
            service = {
                DISABLE_REGISTRATION = true;
            };

            server = {
                DOMAIN = "git.dirae.org";
                ROOT_URL = "https://git.dirae.org";
                HTTP_PORT = 3001;
            };

            ui = {
                THEMES = ''
                    forgejo-auto,forgejo-light,forgejo-dark,auto,gitea,arc-green
                '';
                DEFAULT_THEME = "forgejo-dark";
            };

            repository = {
                DEFAULT_BRANCH = "master";
            };
        };
        
        database = {
            type = "postgres";
            passwordFile = "/var/keys/gitea/db";
        };
    };

    services.postgresql = {
        enable = true;
        authentication = ''
            local gitea all ident map=gitea-users
        '';
        identMap = ''
            gitea-users gitea gitea
        '';
    };
}
