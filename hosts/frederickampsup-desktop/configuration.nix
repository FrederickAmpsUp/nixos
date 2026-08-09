{
  networking.hostName = "frederickampsup-desktop";

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  home-manager.extraSpecialArgs = {
    isDesktop = true;
  };

  imports = [
    ./hardware-configuration.nix

    ../../modules/common.nix
    ../../modules/system.nix
    ../../modules/desktop.nix

    ../../modules/users/frederickampsup/user.nix
  ];
}
