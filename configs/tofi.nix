{ config, pkgs, inputs, ... }: {

  programs.tofi = {
    enable = true;
    settings = {
      border-width = 2;
      height = "25%";
      width = "25%";
      drun-launch = true;
    };
  };

}
