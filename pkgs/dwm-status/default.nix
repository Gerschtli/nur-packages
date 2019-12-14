{ stdenv, lib, rustPlatform, fetchFromGitHub
, coreutils, dnsutils, iproute, wirelesstools, alsaUtils
, makeWrapper, pkgconfig, dbus, gdk_pixbuf, libnotify, xorg
, useGlobalAlsaUtils }:

let
  config = builtins.fromJSON (builtins.readFile ./config.json);

  binPath = stdenv.lib.makeBinPath (
    [ coreutils dnsutils iproute wirelesstools ]
    ++ lib.optional (!useGlobalAlsaUtils) alsaUtils
  );
in

rustPlatform.buildRustPackage rec {
  inherit (config) cargoSha256;

  name = "dwm-status";

  src = fetchFromGitHub {
    inherit (config) rev sha256;

    owner = "Gerschtli";
    repo = "dwm-status";
  };

  nativeBuildInputs = [ makeWrapper pkgconfig ];
  buildInputs = [ dbus gdk_pixbuf libnotify xorg.libX11 ];

  postInstall = ''
    wrapProgram $out/bin/${name} --prefix "PATH" : "${binPath}"
  '';
}
