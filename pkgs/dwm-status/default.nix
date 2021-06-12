{ pkgs, fetchFromGitHub }:

let
  config = builtins.fromJSON (builtins.readFile ./config.json);

  src = fetchFromGitHub {
    inherit (config) rev sha256;

    owner = "Gerschtli";
    repo = "dwm-status";
  };
in

import src { inherit pkgs; }
