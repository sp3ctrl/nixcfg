# Minimal NixosConfig by sp3ctrl

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "sp3ctrl";
  # networking.wireless.enable = true; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/Bogota";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8" 
    "es_CO.UTF-8/UTF-8"
  ];
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us,latam";
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  programs.hyprland = { 
    enable = true;
    xwayland.enable = true;  
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
  
  services.displayManager.ly = {
    enable = true;
    x11Support = true;
    settings = {
      animation = "cmatrix";
      animation_timeout_sec = 60;
      blank_box = false;
    };
  };

  # Bluetooth 
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
     
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # USERS
  users.users.sp1 = {
    isNormalUser = true;
    description = "sp1";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      neovim
      tree
    ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    libgcc
    kitty
        
  ];

      
  system.stateVersion = "25.11"; 
}
