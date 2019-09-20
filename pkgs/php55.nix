{ callPackage, fetchFromGitHub, fetchurl, pkgs }:

let
  # one commit before php 5.6 drop
  # https://github.com/NixOS/nixpkgs/commit/7e6b76fc6bdebb12c8c3c2e6223f9fe5f3b38a39#diff-e3f1a5e8a80452693ffb5de49ae02c5b
  pinnedPkgs = import (fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "846d8f8305192dcc3a63139102698b4ac6b9ef9f";
    sha256 = "1qifgc1q2i4g0ivpfjnxp4jl2cc82gfjws08dsllgw7q7kw4b4rb";
  }) {
    config = { };
    overlays = [ ];
  };

  php55 = pinnedPkgs.php56.overrideDerivation (old: rec {
    name = "php-${version}";
    version = "5.5.38";

    src = fetchurl {
      url = "http://www.php.net/distributions/php-${version}.tar.bz2";
      sha256 = "0f1y76whg6yx9a18mh97f8yq8lb64ri1f0zfr9la9374nbmq2g27";
    };
  });

  packages = callPackage
    (pinnedPkgs.path + "/pkgs/top-level/php-packages.nix")
    {
      inherit pkgs;
      php = php55;
    };
in

php55 // { inherit packages; }
