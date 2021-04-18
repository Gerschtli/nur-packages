{ fetchFromGitHub }:

let
  # commit before jdk14 drop
  # https://github.com/NixOS/nixpkgs/commit/13e3d2bc4bcef95e2ac0f1bb90581066f2e71b71
  pinnedPkgs = import ./lib/pkgs.nix {
    inherit fetchFromGitHub;

    name = "nixpkgs-for-jdk14";
    rev = "e9158eca70ae59e73fae23be5d13d3fa0cfc78b4";
    sha256 = "sha256-o/jWhOSAlaK7y2M57OIriRt6whuVVocS/T0mG7fd1TI=";
  };
in

pinnedPkgs.jdk14
