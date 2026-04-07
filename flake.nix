{
  description = "Home Manager configuration of cj";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    waybar-module-music = {
      url = "github:Andeskjerf/waybar-module-music";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    statcat.url = "github:FluffoCJ/StatCat";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      spicetify-nix,
      catppuccin,
      stylix,
      waybar-module-music,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."cj" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          hypr-darkwindow = inputs.hypr-darkwindow;
        };

        modules = [
          ./home.nix
          #inputs.nixvim.homeManagerModules.nixvim
          catppuccin.homeManagerModules.catppuccin
          stylix.homeManagerModules.stylix
          (
            { ... }:
            {
              nixpkgs.overlays = [ waybar-module-music.overlays.default ];
            }
          )
        ];

      };
    };
}
