{ fetchFromGitHub }:

let
  # commit before jdk15 drop
  # https://github.com/NixOS/nixpkgs/commit/9dde9d8b9ee4b7a4dfbb0ab1204d9f6f4a188360
  pinnedPkgs = import ./lib/pkgs.nix {
    inherit fetchFromGitHub;

    name = "nixpkgs-for-jdk15";
    rev = "df175b7f61d852dc599fe248b1a8666c312457bd";
    sha256 = "sha256-34efLXUJTptdBNFs6HIwy9uXy/piYscFDMETSvXzXqw=";
  };
in

pinnedPkgs.jdk15
