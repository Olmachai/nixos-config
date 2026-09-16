{ config, pkgs, ... }:

{
  home.username = "olma";
  home.homeDirectory = "/home/olma";
  
  imports = [
    ./home/fastfetch/fastfetch.nix
    ./home/bash/bash.nix
    ./home/starship/starship.nix
    ./home/alacritty/alacritty.nix
    ./home/sway/sway.nix
    ./home/kdeglobals/kdeglobals.nix
    ./home/noctalia/noctalia.nix
  ];


  home.packages = with pkgs; [
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
