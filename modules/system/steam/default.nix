{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gamemode
    protonup-qt
    protontricks
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

}
