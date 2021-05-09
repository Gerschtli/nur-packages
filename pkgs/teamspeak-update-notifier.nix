{ fetchFromGitHub, python39, python39Packages }:

python39.pkgs.buildPythonPackage rec {
  pname = "teamspeak-update-notifier";
  version = "1.7.0";

  src = fetchFromGitHub {
    owner = "Gerschtli";
    repo = "teamspeak-update-notifier";
    rev = version;
    sha256 = "sha256-CyO6CXWIvb74cFQ3rQ21zWAWdUxN97SqqfcBX3uEoOY=";
  };

  propagatedBuildInputs = with python39Packages; [
    beautifulsoup4
    requests
  ];

  checkInputs = with python39Packages; [
    pytest
    pytestrunner
  ];
}
