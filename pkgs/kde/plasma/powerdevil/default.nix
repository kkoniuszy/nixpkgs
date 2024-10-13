{
  mkKdeDerivation,
  pkg-config,
  qtwayland,
  ddcutil,
}:
mkKdeDerivation {
  pname = "powerdevil";

  extraNativeBuildInputs = [ pkg-config ];
  extraBuildInputs = [ qtwayland ddcutil ];
}
