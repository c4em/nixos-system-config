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
                user = {
                    REPO_PAGING_NUM = 50;
                };
                meta = {
                    AUTHOR = "dirae.org Forgejo instance";
                    DESCRIPTION = "Forgejo instance hosting git repositories for dirae.org";
                    KEYWORDS = "go,git,self-hosted,gitea,forgejo,foss,oss,decentrialised,federation";
                };
            };

            repository = {
                DEFAULT_BRANCH = "master";
                DISABLE_STARS = true;
                ENABLE_PUSH_CREATE_USER = true;
                DEFAULT_REPO_UNITS = '';
                    repo.code,repo.releases,repo.issues,repo.pulls
                '';
                PREFERRED_LICENSES="GPL-3.0-or-later,AGPL-3.0-or-later";
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
