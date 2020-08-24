{ callPackage, fetchFromGitHub, fetchurl, pkgs }:

let
  # working commit before php72 drop
  # https://github.com/NixOS/nixpkgs/commit/e9bd19d4d352f45e871cfc3e91f854cb76ff48e1
  pinnedPkgs = import (fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "e9bd19d4d352f45e871cfc3e91f854cb76ff48e1";
    sha256 = "07pwvd45ra4d4xlhb7m5z04faqm2s51w4bk6yl750gy96w6cmnqk";
  }) {
    config = { };
    overlays = [ ];
  };

  php72 = pinnedPkgs.php72.overrideAttrs (old: {
    postInstall = old.postInstall + ''
      ln -snf $out/bin/php $out/bin/php72
    '';
  });

  packages = callPackage
    (pinnedPkgs.path + "/pkgs/top-level/php-packages.nix")
    {
      inherit pkgs;
      php = php72;
    };
in

php72 // { inherit packages; }
