{ config, pkgs, ... }:

{
  home.username = "frederickampsup";
  home.homeDirectory = "/home/frederickampsup";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;

    autocd = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      nrs = "sudo nixos-rebuild switch -I nixos-config=$HOME/nixos/configuration.nix";
      nixdev = "nix develop --command=\"$SHELL\"";
      ls = "eza";
      ll = "eza -lah";
      la = "eza -a";
      cd = "z";
    };

    initContent = ''
      eval "$(starship init zsh)"

      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];

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
