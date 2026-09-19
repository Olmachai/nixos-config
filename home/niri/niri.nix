{ pkgs, config, ... }:

let 
  conf = "${config.home.homeDirectory}/nixos-config/home/niri/config";

in
{
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink conf;
    recursive = true;
  };

  home.pointerCursor = {
    enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };
}