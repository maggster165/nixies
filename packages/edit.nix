# {lib, stdenv, fetchFromGitHub, rustPlatform}:
with import <nixpkgs>
{
  overlays = [
    (import (fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"))
  ];
};
let
  rustPlatform = makeRustPlatform {
    cargo = rust-bin.nightly.latest.minimal;
    rustc = rust-bin.nightly.latest.minimal;
  };
  in

  rustPlatform.buildRustPackage rec {
    pname = "ms-edit";
    version = "1.2.0";
    src = fetchFromGitHub {
      owner = "microsoft";
      repo = "edit";
      rev = "v${version}";
      sha256 = "sha256-G5U5ervW1NAQY/fnwOWv1FNuKcP+HYcAW5w87XHqgA8=";
    };
     cargoHash = "sha256-ceAaaR+N03Dq2MHYel4sHDbbYUOr/ZrtwqJwhaUbC2o=";

    postInstall = ''
      mv $out/bin/edit $out/bin/msedit
    '';

    meta = with lib; {
      description = "Microsoft Edit";
      homepage = "https://github.com/microsoft/edit";
      license = with licenses; [mit];
      maintainers = with maintainers; [maggiepi];
      mainProgram = "msedit";
    };
  }
