{ ... }:

{
    services.gitlab = {
        enable = true;
        host = "gitlab.dirae.org";

        # Server is running on limited budet :,)
        # https://docs.gitlab.com/omnibus/settings/memory_constrained_envs.html
        puma.workers = 0;

        user = "gitlab";
        group = "gitlab";

        https = true;
        databasePasswordFile = "/var/keys/gitlab/db_password";
        initialRootPasswordFile = "/var/keys/gitlab/root_password";
        secrets = {
            dbFile = "/var/keys/gitlab/db";
            secretFile = "/var/keys/gitlab/secret";
            otpFile = "/var/keys/gitlab/otp";
            jwsFile = "/var/keys/gitlab/jws";
        };
    };
}
