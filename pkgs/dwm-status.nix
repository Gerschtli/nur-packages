{ pkgs }:

import (fetchTarball {
  url = "https://github.com/Gerschtli/dwm-status/archive/master.tar.gz";
}) { inherit pkgs; }
