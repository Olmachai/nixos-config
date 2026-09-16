# import this file in configuration.nix
{ config, pkgs, ... }: {
  
    programs.sway = {
    enable = true;
    extraPackages = [];
    wrapperFeatures.gtk = true;
    extraOptions = [
      "--unsupported-gpu"
    ];
   };

  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";   
  services.gnome.gnome-keyring.enable = true; #secrets ts
  #security.polkit.enable = true; #For sway using home-manager
  security.pam.services = {
    ly.enableGnomeKeyring = true; #change according to your display manager
  };

  
  #Screensharing (needs pipewire too)
  #Tip: Make sure that you do not have conflicting definitions for xdg.portal in Home Manager.  
  #App and reigon recording doesn't work 
  xdg = {
    portal = {
      enable = true;
      wlr = {
        enable = true;
        settings = {
          screencast = {
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
          };
        };
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
  security.rtkit.enable = true;

   environment.systemPackages = with pkgs; [
   #wl-clipboard
   #waypaper # Wallpaper selector.
   
   #not required by noctalia. 
   #libsForQt5.qt5ct # qt5 theme manger.
   wlsunset   
   # setup needed on first install: https://docs.noctalia.dev/noctalia/templates/official/gtk-qt/
   adw-gtk3
   nwg-look #GTK theme manager.
   nwg-icon-picker
   kdePackages.qt6ct # qt6 theme manger.
   kdePackages.dolphin
   pavucontrol
   gruvbox-gtk-theme #set icon theme in nwg-look.
   gruvbox-dark-icons-gtk
   kanagawa-icon-theme
   slurp
 ];

  programs.xfconf.enable = true; #saves prefrences of thunar if not on xfce.
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  services.udisks2.enable = true;
  services.devmon.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman
      thunar-vcs-plugin
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };
  # services.displayManager.sessionPackages = [ pkgs.sway ];    
}

