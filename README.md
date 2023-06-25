[Old hyprland config can be found here](https://github.com/c4em/nixos-system-config/tree/deprecated)
# nixos-system-config
Modular multi-purpose NixOS configuration.

## About
Feel free to do whatever with this configuration.  
This configuration [erases your darlings](https://grahamc.com/blog/erase-your-darlings/) using ZFS snapshots.  
Currently only used for my homeserver, [desktop runs on Gentoo](https://git.dirae.org/caem/dotfiles).  

## Layout
```
/nix/config
├── flake.lock
├── flake.nix                   ; Master configuration file
├── overlays                    ; Package overlays
├── packages                    ; Packages with configurations
│   ├── nginx
│   │   └── homeserver.nix
│   ├── syncthing
│   │   └── homeserver.nix
│   └── vim
│       └── package.nix
├── pw                          ; Password of your user
├── sets                        ; Sets of packages 
│   └── meta
│       └── sysadmin.nix
├── systems                     ; System specific configuration
│   ├── common.nix
│   ├── hardware                ; Hardware configuration of each system
│   │   ├── homeserver.nix
│   │   └── qemu-vm.nix
│   ├── homeserver.nix
│   ├── persist                 ; Persistence configuration of each system
│   │   ├── common.nix
│   │   ├── homeserver.nix
│   │   └── qemu-vm.nix
│   └── qemu-vm.nix
└── users                       ; User specific configuration
    ├── media.nix
    ├── none.nix
    └── user.nix
```
