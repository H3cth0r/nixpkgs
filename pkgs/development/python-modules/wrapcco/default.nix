{ lib
, buildPythonPackage
, fetchPypi
, numpy
, setuptools
}:

buildPythonPackage rec {
  pname = "wrapcco";
  version = "0.1.3";  # Update version
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-nts5cujixB+PfAf9Fk7kOXW4BeI/0q5GYTthCI76ZOA=";
  };

  nativeBuildInputs = [ setuptools ];  # Build-time only
  propagatedBuildInputs = [ numpy setuptools ];   # Remove setuptools here unless explicitly needed at runtime

  meta = with lib; {
    description = "Supercharge Python with C++ extensions!...";
    homepage = "https://github.com/H3cth0r/wrapc.co";
    license = licenses.mit;
    maintainers = with maintainers; [ h3cth0r ];
  };
}
