{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.rofi = {
    enable = true;

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          lightfg = mkLiteral (lib.mkForce "#cba6f7"); # Override stylix's lightfg with catppuccin's mauve color
        };

      };
    modes = [
      "drun"
      "calc"
      "emoji"
      "nerdy"
    ];
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
      pkgs.rofi-nerdy

    ];
  };

}
