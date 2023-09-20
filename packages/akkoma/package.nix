{ pkgs, ... }:

{
    services.akkoma = {
        enable = true;

        config = {
            ":pleroma" = {
                ":instance" = {
                    name = "Dirae";
                    description = "This server uses NixOS btw";
                    email = "caem@dirae.org";
                    registration_open = false;
                };

                "Pleroma.Upload".filters = map (pkgs.formats.elixirConf { }).lib.mkRaw [
                    "Pleroma.Upload.Filter.Exiftool"
                    "Pleroma.Upload.Filter.Dedupe"
                    "Pleroma.Upload.Filter.AnonymizeFilename"
                ];
            };

            "Pleroma.Web.Endpoint" = {
                url.host = "social.dirae.org";
            };
        };
    };
}
