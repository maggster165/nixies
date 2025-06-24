{
  description = "Maggie's NixOS flake";

  inputs = {
    # package sources
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    moonlight = {
      url = "github:moonlight-mod/moonlight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mpdpkgs.url = "github:NixOS/nixpkgs/c74daf34b6de017d7d43196c494f887a2b956f0f";
  };

  outputs = { self, nixpkgs, spicetify-nix, nix-flatpak, home-manager, moonlight, mpdpkgs, ...}@inputs: {
    nixosConfigurations.Nijika = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;

        pkgs-mpd = import mpdpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = [
        ./configuration.nix
        spicetify-nix.nixosModules.spicetify
        nix-flatpak.nixosModules.nix-flatpak

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

