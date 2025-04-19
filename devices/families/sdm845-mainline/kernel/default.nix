{ mobile-nixos
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.14.0-rc5";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.14-rc5-r2";
    hash = "sha256-iNC5//u/MbAgJEYy3RcX1bhrPqoxSlxs4+3DzoXolQ4=";
  };

  patches = [
#    ./nfc.patch
    ./nfc2.patch
  ];

  isModular = false;
  isCompressed = "gz";
}
