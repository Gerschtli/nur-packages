{ lib, fetchFromGitHub, dwm }:

let
  config = builtins.fromJSON (builtins.readFile ./config.json);

  src = fetchFromGitHub {
    inherit (config) rev sha256;

    owner = "Gerschtli";
    repo = "dwm";
  };
in

dwm.overrideDerivation (old: {
  patches = [
    "${src}/patch-${lib.getVersion old}.diff"
  ];
})
