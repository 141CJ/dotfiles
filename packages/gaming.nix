{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gamemode
    protonup-qt
    prismlauncher
    vinegar
  ];

}
