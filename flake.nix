{
  description = "Maggie's NixOS flake";

  inputs = {
    # package sources
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    xwpin.url = "github:NixOS/nixpkgs/86673af28a29d77fd59790b566425ba86f644ba0";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    niri.url = "github:sodiboo/niri-flake";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    moonlight = {
      url = "github:moonlight-mod/moonlight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, xwpin, spicetify-nix, nix-flatpak, niri, home-manager, moonlight, ...}@inputs: {
    nixosConfigurations.Nijika = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;

        pkgs-xs = import xwpin {
          inherit system;
          config.allowUnfree = true;
          };
        };
      modules = [
        ./configuration.nix
        spicetify-nix.nixosModules.spicetify
        nix-flatpak.nixosModules.nix-flatpak
        niri.nixosModules.niri

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.maggie = import ./home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
 };
}

