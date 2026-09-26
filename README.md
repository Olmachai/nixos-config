# nixos-config
My NixOS configuration with Noctalia shell + Sway + Niri.

## Screenshots
Niri-Blue
<img width="1920" height="1080" alt="Screenshot from 2026-09-19 21-48-36" src="https://github.com/user-attachments/assets/c84b9ccd-a94a-444c-b381-cf05cea2dcfd" />

Sway-Kanagawa
<img width="1920" height="1080" alt="screenshot_20260916_035033-region" src="https://github.com/user-attachments/assets/0a8590d9-cac9-47d9-821c-1f47a4488e65" />

Sway-Gruvbox Dark
<img width="1920" height="1080" alt="screenshot_20260917_005702-region" src="https://github.com/user-attachments/assets/b2254d5c-5f93-4947-b613-56b2a9aaa7f9" />

## Installation Instructions
### 1. Install Prep

First, Install NixOS and add the following to your "/etc/nixos/confguration.nix" file.

```

nix.settings.experimental-features = [ "nix-command" "flakes" ];

environment.systemPackages = with pkgs; [
    git
];

```

Then, run 
```

sudo nixos-rebuild switch

```
for the changes to take effect.

### 2. The Actual Installation
Run
```

git clone https://github.com/Olmachai/nixos-config.git
cd nixos-config
cp /etc/nixos/hardware-configuration.nix .
```

Then, edit the "./modules/users.nix" file with your own username.

Finally, run
```

sudo nixos-rebuild switch --flake .

```
and reboot your system.