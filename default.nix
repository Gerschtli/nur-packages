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

  dwm-status = pkgs.callPackage ./pkgs/dwm-status { };

  nerdfonts-ubuntu-mono = pkgs.callPackage ./pkgs/nerdfonts-ubuntu-mono.nix { };

  pass = pkgs.callPackage ./pkgs/pass.nix { };

  teamspeak-update-notifier = pkgs.callPackage ./pkgs/teamspeak-update-notifier.nix { };
}
