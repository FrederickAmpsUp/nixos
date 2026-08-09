{ pkgs, isDesktop, ... }:

{
  home.file.".config/hypr/monitors.lua".source =
    if isDesktop
    then ../../../../dotfiles/hypr/monitors_desktop.lua
    else ../../../../dotfiles/hypr/monitors_laptop.lua;

  home.packages = with pkgs; [
    chromium
    kitty

    quickshell

    pavucontrol

    discord
    spotify
  ];
}
