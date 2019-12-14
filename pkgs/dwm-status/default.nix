{ pkgs, fetchFromGitHub, useGlobalAlsaUtils }:

let
  config = builtins.fromJSON (builtins.readFile ./config.json);

  dwm-status = fetchFromGitHub {
    inherit (config) rev sha256;

    owner = "Gerschtli";
    repo = "dwm-status";
  };
in

import dwm-status { inherit pkgs useGlobalAlsaUtils; }
