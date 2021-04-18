# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {} }:

{
  dmenu = pkgs.callPackage ./pkgs/dmenu { };

  dwm = pkgs.callPackage ./pkgs/dwm { };

  dwm-status = pkgs.callPackage ./pkgs/dwm-status { useGlobalAlsaUtils = false; };

  dwm-status-without-alsa-utils = pkgs.callPackage ./pkgs/dwm-status { useGlobalAlsaUtils = true; };

  jdk14 = pkgs.callPackage ./pkgs/jdk14.nix { };

  jdk15 = pkgs.callPackage ./pkgs/jdk15.nix { };

  maven35 = pkgs.callPackage ./pkgs/maven35.nix { };

  nerdfonts-ubuntu-mono = pkgs.callPackage ./pkgs/nerdfonts-ubuntu-mono.nix { };

  pass = pkgs.callPackage ./pkgs/pass.nix { };

  php55 = pkgs.callPackage ./pkgs/php55.nix { };

  php72 = pkgs.callPackage ./pkgs/php72.nix { };

  teamspeak-update-notifier = pkgs.callPackage ./pkgs/teamspeak-update-notifier.nix { };
}
