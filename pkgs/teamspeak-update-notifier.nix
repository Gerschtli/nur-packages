{ fetchFromGitHub, python37, python37Packages }:

python37.pkgs.buildPythonPackage rec {
  pname = "teamspeak-update-notifier";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "Gerschtli";
    repo = "teamspeak-update-notifier";
    rev = version;
    sha256 = "16n9lyx0m9gqbi6qh61bcayflq6cyh7z5g259dqvq9caxc2piypv";
  };

  propagatedBuildInputs = with python37Packages; [
    beautifulsoup4
    requests
  ];

  checkInputs = with python37Packages; [
    pytest
    pytestrunner
  ];
}
