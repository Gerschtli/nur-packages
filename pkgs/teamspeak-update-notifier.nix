{ fetchFromGitHub, python39, python39Packages }:

python39.pkgs.buildPythonPackage rec {
  pname = "teamspeak-update-notifier";
  version = "1.7.1";

  src = fetchFromGitHub {
    owner = "Gerschtli";
    repo = "teamspeak-update-notifier";
    rev = version;
    sha256 = "sha256-S0EMwOTfDHhD5uipxM9m2WMkke9l6kjCWDmzBm0vquo=";
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
