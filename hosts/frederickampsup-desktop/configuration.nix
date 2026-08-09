{
  networking.hostName = "frederickampsup-desktop";

  imports = [
    ./hardware-configuration.nix

    ../../modules/common.nix
    ../../modules/system.nix
    ../../modules/desktop.nix

    ../../modules/users/frederickampsup/user.nix
  ];
}
