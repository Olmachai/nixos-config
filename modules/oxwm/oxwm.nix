{ config, pkgs, ... }:

{

  services.xserver = {
    enable = true;
    windowManager.oxwm.enable = true;
    dpi = 900;
    xkb = {
      layout = "tr";
      variant = "";
    };
  };
  services.gnome.gnome-keyring.enable = true;
}
