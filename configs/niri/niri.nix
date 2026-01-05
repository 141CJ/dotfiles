{ pkgs, inputs, ... }:
{
  imports = [ inputs.niri.homeModules.niri ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  home.file.".config/niri/config.kdl" = {
    source = ./config.kdl;
  };

}
