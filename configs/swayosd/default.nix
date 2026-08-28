{ ... }:
{
  home.file.".config/swayosd/style.css" = {
    source = ./style.css;
  };
  home.file.".config/swayosd/config.toml" = {
    source = ./config.toml;
  };

  services.swayosd = {
    enable = true;
  };
}
