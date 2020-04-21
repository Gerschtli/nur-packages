{ pkgs }:

pkgs.nerdfonts.override (
  # in unstable channels use fonts arg
  if pkgs.nerdfonts.override.__functionArgs ? "fonts"
  then { fonts = [ "UbuntuMono" ]; }
  else { withFont = "UbuntuMono"; }
)
