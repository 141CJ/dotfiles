{ pkgs, inputs, ... }:
let
  stable = import <nixos-25.05> {
    config = {
      allowUnfree = true;
    };
  };
in

{

  nixpkgs.config = {
    packageOverrides =
      pkgs: with pkgs; {
        stable = import stableTar {
          config = config.nixpkgs.config;
        };
      };
  };
  home.packages = with pkgs; [
    firefox
    protonup-qt
    waybar
    swaynotificationcenter
    btop
    pavucontrol
    alacritty
    easyeffects
    feh
    file-roller
    xfce.thunar
    vlc
    gimp
    ffmpeg
    fuzzel
    (pkgs.discord.override { withVencord = false; })
    legcord
    vinegar
    # rofi
    kdePackages.kdenlive
    vscode
    godot
    # protonvpn-gui
    openrgb-with-all-plugins
    lmms
    prismlauncher
    krita
  ];

  programs.obs-studio.enable = true;
  programs.obs-studio.package = (pkgs.obs-studio.override { cudaSupport = true; });
}
