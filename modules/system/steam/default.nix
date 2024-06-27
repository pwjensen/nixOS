{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gamemode
    protonup-qt
    protontricks
  ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

}
