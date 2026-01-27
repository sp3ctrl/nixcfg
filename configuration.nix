# Minimal NixosConfig by sp3ctrl

{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "sp3ctrl";
  # networking.wireless.enable = true; 
  networking.networkmanager.enable = true;

  # Time zone and locale
  time.timeZone = "America/Bogota";
  i18n.defaultLocale = "en_US.UTF-8";
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

  #Enable XFCE
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  
  # Enable Bluetooth support for XFCE
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  # Blueman GUI manager for XFCE
  services.blueman.enable = true;

  services.displayManager.defaultSession = "xfce";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  # Audio
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # USERS
  # Don't forget to set a password with ‘passwd’
  users.users.sp1 = {
    isNormalUser = true;
    description = "sp1";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      neovim
      tree
    ];
  };

  # SOFTWARE
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    libgcc
    bat

  ];

      
  system.stateVersion = "25.11"; 
}
