{ pkgs, inputs, config, ... }:

{
  programs.niri = {
    enable = true;
    useNautilus = true;

  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
    config.niri = {
#      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];  # uncomment if not using nautilus.  
    };
  };

  # uncomment if not using nautilus.
#  xdg.mime.defaultApplications = {
#    "inode/directory" = "thunar.desktop";
#  };

  environment.systemPackages = with pkgs; [
    nautilus
    xwayland-satellite
    nirimod
  ];
  
  services.xserver.upscaleDefaultCursor = true;
  environment.variables = {
    XCURSOR_SIZE = "24";
  };
  services.displayManager.defaultSession = "niri";
}

