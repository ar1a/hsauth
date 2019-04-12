{ mkDerivation, base, classy-prelude, pcre-heavy, stdenv, time
, time-lens
}:
mkDerivation {
  pname = "hsauth";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base classy-prelude pcre-heavy time time-lens
  ];
  license = stdenv.lib.licenses.bsd3;
}
