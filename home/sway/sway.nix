{ pkgs, config, lib, ... }: let
   
  swayPath = "${config.home.homeDirectory}/nixos-config/home/sway/config.in";
  
  in
  {
  xdg.configFile."sway/config".source = config.lib.file.mkOutOfStoreSymlink swayPath;
  }

