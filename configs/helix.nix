{ config, pkgs, inputs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      keys.normal = {
        "S-l" = ":buffer-next";
        "S-h" = ":buffer-previous";
        "C-i" = ":toggle-option lsp.display-inlay-hints";

      };
      editor = {
        clipboard-provider = "wayland";
        line-number = "relative";
        auto-info = true;
        auto-completion = true;
        bufferline = "always";
        indent-guides.render = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };

    languages.language = [
      {
        name = "rust";
        auto-format = true;
      }
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "c";
        auto-format = true;
      }
    ];
    # themes = { };
  };
}
