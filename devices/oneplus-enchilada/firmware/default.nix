{ lib
, fetchFromGitLab
, runCommand
}:

let
  baseFw = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "firmware-oneplus-sdm845";
    rev = "176ca713448c5237a983fb1f158cf3a5c251d775";
    sha256 = "sha256-ZrBvYO+MY0tlamJngdwhCsI1qpA/2FXoyEys5FAYLj4=";
  };
in runCommand "oneplus-sdm845-firmware" {
  inherit baseFw;
  # We make no claims that it can be redistributed.
  meta.license = lib.licenses.unfree;
} ''
  mkdir -p $out/lib/firmware
  cp -r $baseFw/lib/firmware/* $out/lib/firmware/
  chmod +w -R $out
  rm -rf $out/lib/firmware/postmarketos
  cp -r $baseFw/lib/firmware/postmarketos/* $out/lib/firmware
''
