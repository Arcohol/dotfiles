{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos-laptop";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    v2raya.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.arcohol = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
  ];

  environment.variables.EDITOR = "vim";
  environment.etc."nixos".source = "/home/arcohol/dotfiles";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
