{ pkgs, isDesktop, ... }:

{
  programs.zsh.enable = true;

  users.users.frederickampsup = {
    isNormalUser = true;
    description = "Frederick Ziola";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
        isDesktop = isDesktop;
    };

    users.frederickampsup = import ./home.nix;
  };
}
