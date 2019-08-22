{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.lorri;
in

{
  meta.maintainers = [ maintainers.gerschtli ];

  options = {
    services.lorri = {
	    enable = mkEnableOption "lorri setup";

      package = mkOption {
        type = types.package;
        default = pkgs.nur.repos.gerschtli.lorri;
        defaultText = "pkgs.nur.repos.gerschtli.lorri";
        description = ''
          Lorri package to install.

          </para><para>

          Note: Because lorri is still under development, they provide only a
          rolling-release branch instead of a package in nixpkgs.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    systemd.user = {
      services.lorri = {
        Unit = {
          Description = "Lorri build daemon";
          Documentation = "https://github.com/target/lorri";
          ConditionUser = "!@system";
          Requires = "lorri.socket";
          After = "lorri.socket";
          RefuseManualStart = true;
        };

        Service = {
          ExecStart = "${cfg.package}/bin/lorri daemon";
          PrivateTmp = true;
          ProtectSystem = "strict";
          WorkingDirectory = "%h";
          Restart = "on-failure";
          Environment =
            let
              path = with pkgs; makeSearchPath "bin" [ nix gnutar git mercurial ];
            in
              concatStringsSep " " [
                "PATH=${path}"
                "RUST_BACKTRACE=1"
              ];
        };
      };

      sockets.lorri = {
        Unit = {
          Description = "Socket for lorri build daemon";
        };

        Socket = {
          ListenStream = "%t/lorri/daemon.socket";
        };

        Install = {
          WantedBy = [ "sockets.target" ];
        };
      };
    };
  };
}
