{ lib
, stdenv
, fetchFromGitHub
,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "dumpasn1";
  version = "20230207.0.0";

  src = fetchFromGitHub {
    owner = "katexochen";
    repo = "dumpasn1";
    rev = "v${finalAttrs.version}";
    hash = "sha256-r40czSLdjCYbt73zK7exCoP/kMq6+pyJfz9LKJLLaXM=";
  };

  CFLAGS = ''-DDUMPASN1_CONFIG_PATH='"$(out)/etc/"' '';

  makeFlags = [ "prefix=$(out)" ];

  patches = [ ./configpath.patch ];

  meta = with lib; {
    description = "Display and debug ASN.1 data";
    homepage = "https://github.com/katexochen/dumpasn1";
    license = licenses.bsd2;
    maintainers = with maintainers; [ katexochen ];
    platforms = platforms.all;
  };
})
