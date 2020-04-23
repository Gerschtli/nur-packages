{ php72 }:

php72.overrideAttrs (old: {
  postInstall = old.postInstall + ''
    ln -snf $out/bin/php $out/bin/php72
  '';
})
