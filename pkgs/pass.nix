{ pass, x11Support }:

let
  # see dmenucmd in dwm config
  dmenuCmd = ''dmenu -fn "Ubuntu Mono Nerd Font:size=9" -nb "#222222" -nf "#bbbbbb" -sb "#540303" -sf "#eeeeee"'';
in

(pass.override { inherit x11Support; }).overrideAttrs (old: {
  postBuild = ''
    sed -i -e 's@ dmenu @ ${dmenuCmd} @g' contrib/dmenu/passmenu
  '';
})
