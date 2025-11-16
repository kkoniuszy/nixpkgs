{
  lib,
  stdenv,
  fetchFromGitHub,
  kernel,
  kernelModuleMakeFlags,
}:

stdenv.mkDerivation rec {
  name = "${pname}-${version}-${kernel.version}";
  pname = "it87";
  version = "unstable-2025-12-26";

  src = fetchFromGitHub {
    owner = "kkoniuszy";
    repo = "it87";
    rev = "993dcb37f7920b9f373a17b2ca300d57db8e2edf";
    hash = "sha256-STGExaLyHlK0Mmx6AFBnJJzvmmg145aBoOvpfyVtcLk=";
  };

  hardeningDisable = [ "pic" ];

  nativeBuildInputs = kernel.moduleBuildDependencies;

  preConfigure = ''
    sed -i 's|depmod|#depmod|' Makefile
  '';

  makeFlags = kernelModuleMakeFlags ++ [
    "TARGET=${kernel.modDirVersion}"
    "KERNEL_MODULES=${kernel.dev}/lib/modules/${kernel.modDirVersion}"
    "MODDESTDIR=$(out)/lib/modules/${kernel.modDirVersion}/kernel/drivers/hwmon"
  ];

  meta = {
    description = "Patched module for IT87xx superio chip sensors support";
    homepage = "https://github.com/frankcrawford/it87";
    license = lib.licenses.gpl2Plus;
    platforms = [
      "x86_64-linux"
      "i686-linux"
    ];
  };
}
