{ config, pkgs, ... }:

{
  home.username = "frederickampsup";
  home.homeDirectory = "/home/frederickampsup";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch -I nixos-config=$HOME/nixos/configuration.nix";
      ls = "eza";
      ll = "eza -lah";
      la = "eza -a";
      cd = "z";
    };

    initContent = ''
      eval "$(starship init zsh)"
    '';
  };

  programs.starship.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile = {
    "nvim" = {
      source = ./dotfiles/nvim;
      recursive = true;
    };

    "hypr" = {
      source = ./dotfiles/hypr;
      recursive = true;
    };

    "quickshell" = {
      source = ./dotfiles/quickshell;
      recursive = true;
    };
  };
}
