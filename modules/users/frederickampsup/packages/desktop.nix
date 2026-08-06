{ pkgs, ... }:

{
  home.packages = with pkgs; [
    chromium
    kitty

    quickshell

    pavucontrol

    #(discord.override {
    #    commandLineArgs = [
    #        "--enable-features=UseOzonePlatform"
    #        "--ozone-platform=wayland"
	#  ];
    #})

    discord
    spotify
  ];
}
