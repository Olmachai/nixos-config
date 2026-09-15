{ pkgs, config, ... }: let
  
  bashrcpath = "${config.home.homeDirectory}/nixos-config/home/bash/bashrc";

  in
  {

  home.file.".bashrc".source = config.lib.file.mkOutOfStoreSymlink bashrcpath;
}
