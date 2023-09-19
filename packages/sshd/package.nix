{ ... }:

{
    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = false;
            ChallengeResponseAuthentication = false;
            KbdInteractiveAuthentication = false;
        };
    };

    users.users."user".openssh.authorizedKeys.keys = [
       "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnopPaLuQT4+5LzqiBM4JfdRamzArszOrfoDy96KpQL9jeZQhT4E7LE63tySza4auJyTkFcnfGEQQaAlCUYTVvWrvB6l2nG7mVZ5Cr0YvQ1U9AY+1OPE5wCSDUk9zaUm3ldWgUWRA/MyGtzm3kQ+ZtYIOqtvF6Ki5vPRYl+QR0cjThw5Sr/99sTqZwgmbPoAkLXnioSI+oOgV6H8M9XCuvwmlm6YKfBrjTQltj93GpSf24Lf9YaFc51Auao78AfOof/EtGWlcBrvfdjaS/scxSmHO9r/AShV/BEVboG+89i+Qia67cATGIwDLB6HZO1dO5qTSImzcQ/QnFW1E0IGZy3LvKd/FT8QCpHjDtPlsxWwIuTgyLD3c9OZTTA8w619QBKic3KEhuRkhuwOqSPgpvgkK8hS91gr8spL+6U4Bdgo8gZH14kj7ZhiNsIur0Chj/X1uCHGXEHhlV4ky2XAxhGSSr9fy06w4uPsIXGnSufm8jbBAhYDrNzaod2Q/73VE= user@workstation" 
    ];

    networking.firewall.allowedTCPPorts = [ 22 ];
}
