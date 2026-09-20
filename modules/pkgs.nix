{ pkgs, config, inputs, override, ... }: 

let 

  davinci-resolve-main = pkgs.callPackage ./davinciResolve-main/package.nix { };

in 
{
 
 
  environment.systemPackages = with pkgs; [ 
    ristretto
    opencode
    pciutils
    bat
    localsend
    btop
    nvtopPackages.nvidia
    prismlauncher
    vlc
    yt-dlp
    davinci-resolve-main
    docker
    docker-compose
    lutris
    protontricks
    protonplus
    qbittorrent
    git
    handbrake
    krita
    ffmpeg
    mpv
    openrgb-with-all-plugins
    vscodium
    discord-canary
    telegram-desktop
    webcamoid
    #vibrantlinux
    openseeface
    kdePackages.ark
    godot
    wireguard-tools
    easyeffects
    eza
    tree
    #inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    firefox
    oculante
    obs-studio
    virtualbox
    digikam
    lmstudio
  ];

     # This expression sets necessary system options for steam to work properly.
  programs.steam = {
    enable = true;
  };

}
