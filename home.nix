
## HOME MANAGER 

{ config, pkgs, ... }:

{
  home.username = "sp1";
  home.homeDirectory = "/home/sp1";

  home.packages = with pkgs; [
   
    # command line tools
    fastfetch
    

    # general use
    qbittorrent
    vlc
    onlyoffice-desktopeditors
    strawberry
    foliate
    thunderbird
    evince
    librewolf
    google-chrome
    obsidian
    spotify
    rssguard

    # themes  
    dracula-theme
    dracula-icon-theme
    afterglow-cursors-recolored
    bibata-cursors

    # archives
    zip
    xz
    unzip
    p7zip

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # hyprland
    rofi
    zsh
    waybar
    swaynotificationcenter
    hyprpaper
    font-awesome
    swaybg
    thunar
    nwg-look #gkt dark mode config
    gnome-themes-extra #gtk dark themes
    qt6Packages.qt6ct #qt dark mode config


    # nixos
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusbi

    # C Development
    gcc
    gdb
    man-pages
    linux-manual

  ];
  
  # GIT
  programs.git = {
    enable = true;
    user.name = "sp3ctrl";
    user.email = "126842764+sp3ctrl@users.noreply.github.com";
  };

  # BASH
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    #bashrcExtra = ''
    # export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    #'';
    shellAliases = {
       sysupdate  = "cd ~/nixcfg/ && sudo nix flake update && sudo nixos-rebuild switch --impure --flake .";
     };
  };

  
  home.stateVersion = "25.11";
}
