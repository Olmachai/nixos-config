{ pkgs, config, ... }:

let 
  conf = "${config.home.homeDirectory}/nixos-config/home/niri/config";

in
{
  xdg.configFile= {
    "niri".source = config.lib.file.mkOutOfStoreSymlink conf;
    recursive = true;
  };
}