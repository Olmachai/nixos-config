{ config, pkgs, inputs, ... }:

{
  
  imports = [ 
    ./modules/hardware/nvidia.nix
    ./modules/hardware/networking.nix
    ./modules/sway/sway.nix
    ./modules/pkgs.nix
    ./modules/users.nix
    ./modules/noctalia/noctalia.nix
    ./modules/niri/niri.nix
  ]; 

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [
      
  ];
  
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;

  services.displayManager.ly.enable = true;

  time.timeZone = "Europe/Istanbul";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.zed-mono
    nerd-fonts.symbols-only
  ]; 

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.xserver.enable = false;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "tr";
      variant = "";
    };

  console.keyMap = "trq";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  home-manager.backupFileExtension = "backup";
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}
