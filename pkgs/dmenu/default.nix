{ lib, fetchFromGitHub, dmenu }:

let
  config = builtins.fromJSON (builtins.readFile ./config.json);

  src = fetchFromGitHub {
    inherit (config) rev sha256;

    owner = "Gerschtli";
    repo = "dmenu";
  };
in

dmenu.overrideDerivation (old: {
  patches = [
    "${src}/patch-${lib.getVersion old}.diff"
  ];
})
