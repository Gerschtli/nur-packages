{ callPackage, fetchFromGitHub, fetchurl, pkgs }:

let
  # one commit before php 7.2 drop
  # https://github.com/NixOS/nixpkgs/commit/e6001db0f72b5be755b759298d111538c5b90365
  pinnedPkgs = import (fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "e6001db0f72b5be755b759298d111538c5b90365";
    sha256 = "0fw35pz6hc6galn8d4bfwshl6r41p0h9m4vy85nqx2n24y6r5qk7";
  }) {
    config = { };
    overlays = [ ];
  };

  php72 = pinnedPkgs.php72.overrideAttrs (old: {
    postInstall = "ln -snf $out/bin/php $out/bin/php72";
  });

  packages = callPackage
    (pinnedPkgs.path + "/pkgs/top-level/php-packages.nix")
    {
      inherit pkgs;
      php = php72;
    };
in

php72 // { inherit packages; }
