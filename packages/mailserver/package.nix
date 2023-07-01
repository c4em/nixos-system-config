{ simple-mailserver, ... }:

{
    imports = [
        simple-mailserver.nixosModule
    ];

    mailserver = {
        enable = true;
        fqdn = "dirae.org";
        domains = [ "dirae.org" ];

        loginAccounts = {
            "caem@dirae.org" = {
                hashedPasswordFile = "/nix/config/packages/mailserver/pw";

                aliases = [
                    "admin@dirae.org"
                    "postmaser@dirae.org"
                    "legal@dirae.org"
                    "contact@dirae.org"
                    "dmca@dirae.org"
                    "pt@dirae.org"
                    "cali@dirae.org"
                    "abuse@dirae.org"
                ];
            };
        };

        # Managed in configuration for nginx
        certificateScheme = "acme";
    };
}
