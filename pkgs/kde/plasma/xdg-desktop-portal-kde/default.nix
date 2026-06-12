{
  mkKdeDerivation,
  pkg-config,
  qtwayland,
  cups,
}:
mkKdeDerivation {
  pname = "xdg-desktop-portal-kde";

  patches = [ ./0001-settings-debounce-appearance-changes.patch ];

  extraNativeBuildInputs = [ pkg-config ];
  extraBuildInputs = [
    qtwayland
    cups
  ];
}
