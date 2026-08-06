{ ... }:

{
  home.packages = with pkgs; [
    git

    neovim
    tree-sitter

    ripgrep

    eza

    brightnessctl
  ];
}
