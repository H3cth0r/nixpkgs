{ lib, buildPythonPackage, fetchPypi, numpy, setuptools }:

buildPythonPackage rec {
  pname = "wrapcco";
  version = "0.1.3"; # Update version
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nts5cujixB+PfAf9Fk7kOXW4BeI/0q5GYTthCI76ZOA=";
  };

  build-system = [ setuptools ]; # Build-time only
  dependencies = [
    numpy
    setuptools
  ]; # Remove setuptools here unless explicitly needed at runtime

  meta = {
    description = "Supercharge Python with C++ extensions!";
    homepage = "https://github.com/H3cth0r/wrapc.co";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ h3cth0r ];
  };
}
