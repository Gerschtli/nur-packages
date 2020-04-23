{ lib, php72 }:

php72.overrideAttrs (old: {
  postInstall =
    lib.optionalString (old ? postInstall) old.postInstall
    + "ln -snf $out/bin/php $out/bin/php72";
})
