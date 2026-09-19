{ pkgs, config, ... }: {
 
  programs.noctalia = {
  enable = true;
  # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
  recommendedServices.enable = true;
  };

  environment.systemPackages = with pkgs; [   
    # setup needed on first install: https://docs.noctalia.dev/noctalia/templates/official/gtk-qt/
    adw-gtk3
    nwg-look #GTK theme manager.
    nwg-icon-picker
    kdePackages.qt6ct # qt6 theme manger.
    pavucontrol
    gruvbox-gtk-theme 
    gruvbox-dark-icons-gtk #set icon theme in nwg-look.
    kanagawa-icon-theme #set icon theme in nwg-look.
 ];
}