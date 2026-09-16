{ config, ... }: 

# state.toml stores changes made through the ui, settings.toml is a "traditional" config file.
let 
  conf = "${config.home.homeDirectory}/nixos-config/home/noctalia/settings.toml";

in
{
  xdg.configFile."noctalia/settings.toml".source = config.lib.file.mkOutOfStoreSymlink conf;
  home.file.".local/state/noctalia/settings.toml".source = config.lib.file.mkOutOfStoreSymlink conf;
}