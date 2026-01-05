{ pkgs, inputs, ... }:
{
  home.file.".config/niri/config.kdl" = {
    source = ./config.kdl;
  };

}
