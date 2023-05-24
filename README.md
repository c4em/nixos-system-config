### Old Hyprland config can be found [here](https://github.com/c4em/nixos-system-config/tree/deprecated)
# nixos-system-config
Modular NixOS configuration with dotfiles. 
## Usage
You should have basic knowledge of NixOS before using this project. Begin at `configuration.nix` and read through the files by following imports. 
Everything should be commented. If something is not satisfactory, feel free to open up an issue or pull request.
## Layout
```
/etc/nixos/
├── configuration.nix             ; master configuration file
├── environments                  ; Desktop environment specific config
│   └── plasma.nix
├── hardware-configuration.nix    ; Replace this with your current hardware-configuration.nix
├── overlays                      ; Package overlays
├── packages                      ; Package specifix configuration
├── profile.nix                   ; Specify the profile to use
├── profiles                      ; Profiles, for example for different machines or workflows
│   └── workstation.nix
├── sets                          ; Sets of packages to install
│   ├── base
│   │   ├── common.nix
│   │   ├── devel.nix
│   │   └── plasma.nix
│   ├── devel
│   │   ├── c.nix
│   │   └── git.nix
│   ├── drivers
│   │   ├── nvidia.nix
│   │   └── tablet.nix
│   └── graphics
│       ├── art.nix
│       └── video.nix
├── username.nix                   ; Set current user
└── users                          ; Users
    └── user.nix
```
## Todo
- [ ] Hyprland configuration
- [ ] Clean up sets directory
- [ ] Add screenshots to README.md
- [ ] Home-manager configuration
