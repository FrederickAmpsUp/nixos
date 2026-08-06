{ pkgs, ... }:

{
  home.username = "frederickampsup";
  home.homeDirectory = "/home/frederickampsup";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;


  imports = [
    ./shell.nix

    ./packages/base.nix
    ./packages/desktop.nix
    ./packages/dev.nix
  ];

  xdg.configFile = {
    "nvim" = {
      source = ../../../dotfiles/nvim;
      recursive = true;
    };

    "hypr" = {
      source = ../../../dotfiles/hypr;
      recursive = true;
    };

    "quickshell" = {
      source = ../../../dotfiles/quickshell;
      recursive = true;
    };
  };
}
