{ fetchFromGitHub, python37, python37Packages }:

python37.pkgs.buildPythonPackage rec {
  pname = "teamspeak-update-notifier";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "Gerschtli";
    repo = "teamspeak-update-notifier";
    rev = version;
    sha256 = "0rzgcmprh314sdwfk0icjj16k29075l42rwpkhvzk9am6vihjk49";
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
