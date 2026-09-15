{ pkgs, config, lib, ... }: let
  #this file allows kde apps themening to work with noctalia.   
  kdeglobalsPath = "${config.home.homeDirectory}/nixos-config/home/kdeglobals/kdeglobals";
  
  in
  {
  xdg.configFile."kdeglobals".source = config.lib.file.mkOutOfStoreSymlink kdeglobalsPath;
  }

  # The only imprtant variables in ./kdeglobals are:
  # Other variables are set by KDE applications automatically.

  # [UiSettings]
  # ColorScheme=noctalia
  #
  # [General]
  # ColorScheme=Noctalia
  # Name=noctalia
