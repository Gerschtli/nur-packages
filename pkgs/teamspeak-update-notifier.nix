{ fetchFromGitHub, python37, python37Packages }:

python37.pkgs.buildPythonPackage rec {
  pname = "teamspeak-update-notifier";
  version = "1.5.2";

  src = fetchFromGitHub {
    owner = "Gerschtli";
    repo = "teamspeak-update-notifier";
    rev = version;
    sha256 = "1vsc9chnk9szzba2j2gixnbn43wky1kdzx1jf18gs91n989m71ry";
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
