{ pkgs, config, ... }: let
  
  alacrittyPath = "${config.home.homeDirectory}/nixos-config/home/alacritty/alacritty.toml";
  themesPath = "${config.home.homeDirectory}/nixos-config/home/alacritty/themes";
  
  in
  {

  programs.alacritty = {
    enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "noctalia";
      theme_background = false;
    };
  };

  xdg.configFile."alacritty/alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink alacrittyPath;
  xdg.configFile."alacritty/themes".source = config.lib.file.mkOutOfStoreSymlink themesPath;
}
