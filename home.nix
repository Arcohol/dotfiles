{ config, pkgs, ... }:

{
  home.username = "arcohol";
  home.homeDirectory = "/home/arcohol";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    neofetch
    mpv

    # fonts
    sarasa-gothic
    inter
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    hack-font

    nixfmt-rfc-style
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Sarasa Term SC" ];
      sansSerif = [ "Inter" ];
      serif = [ "Noto Serif" ];
    };
  };

  programs = {
    git = {
      enable = true;
      aliases = {
        co = "checkout";
      };
      userName = "Tiantian Li";
      userEmail = "i@arcohol.com";
      signing = {
        key = null;
        signByDefault = true;
      };
    };

    vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      mutableExtensionsDir = false;
      extensions = with pkgs.vscode-extensions; [
        github.github-vscode-theme
        github.copilot
        github.copilot-chat
        vscodevim.vim
      ];
      userSettings = {
        "security.workspace.trust.enabled" = false;
        "files.autoSave" = "afterDelay";
        "workbench.startupEditor" = "none";
        "workbench.colorTheme" = "GitHub Dark Default";
        "editor.fontFamily" = "Hack";
      };
    };

    gpg.enable = true;
    firefox.enable = true;

    home-manager.enable = true;
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };
}
