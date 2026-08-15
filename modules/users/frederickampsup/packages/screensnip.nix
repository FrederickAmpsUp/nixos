{ pkgs, ... }:

let
  screensnip = pkgs.writeShellApplication {
    name = "screensnip";
    runtimeInputs = with pkgs; [
      grim
      slurp
      wl-clipboard
    ];

    text = ''
#!/usr/bin/env bash

set -e

dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"

file="$dir/$(date '+%Y-%m-%d_%H-%M-%S').png"

# Rectangle selection
geometry="$(slurp)" || exit 0

grim -g "$geometry" "$file"
wl-copy < "$file"
    '';
  };
in
{
  home.packages = [ screensnip ];
}
