{ fetchFromGitHub, python36, python36Packages }:

python36.pkgs.buildPythonPackage rec {
  pname = "teamspeak-update-notifier";
  version = "1.4.2";

  src = fetchFromGitHub {
    owner = "Gerschtli";
    repo = "teamspeak-update-notifier";
    rev = version;
    sha256 = "08s6xwjdppin8h27qjwkn9kkxgbls24w83zgakkv88pcp604cpsc";
  };

  propagatedBuildInputs = with python36Packages; [
    beautifulsoup4
    requests
  ];

  checkInputs = with python36Packages; [
    pytest
    pytestrunner
  ];
}
