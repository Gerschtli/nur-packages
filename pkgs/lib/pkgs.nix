{ fetchFromGitHub, name, rev, sha256 }:

import (fetchFromGitHub {
  inherit name rev sha256;

  owner = "NixOS";
  repo = "nixpkgs";
}) {
  config = { };
  overlays = [ ];
}
