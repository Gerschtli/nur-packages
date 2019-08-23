with builtins;

let
  modules = import ./.;

  flatten = list: concatMap (e: if isAttrs e then flatten (attrValues e) else [ e ]) list;
in

flatten (attrValues modules)
