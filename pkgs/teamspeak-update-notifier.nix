{ fetchFromGitHub, python39, python39Packages }:

python39.pkgs.buildPythonPackage rec {
  pname = "teamspeak-update-notifier";
  version = "1.6.0";

  src = fetchFromGitHub {
    owner = "Gerschtli";
    repo = "teamspeak-update-notifier";
    rev = version;
    sha256 = "sha256-l0XfdYd8hN95WLVKRSIy8Ltw6gDurD1jNQvZvw4zdZ0=";
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
