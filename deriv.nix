{ lib, rustPlatform, fetchFromGitHub, pkgconfig, openssl }:
rustPlatform.buildRustPackage rec {
  pname = "scaphandre";
  version = "0.5.0";
  src = fetchFromGitHub {
    owner = "hubblo-org";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-cXwgPYTgom4KrL/PH53Fk6ChtALuMYyJ/oTrUKHCrzE=";
  };

  cargoSha256 = "sha256-Vdkq9ShbHWepvIgHPjhKY+LmhjS+Pl84QelgEpen7Qs=";

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ openssl ];
  # checkType = "debug";
  doCheck = false;

  meta = with lib; {
    description = "Electrical power consumption metrology agent";
    homepage = "https://github.com/hubblo-org/scaphandre";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ mmai ];
  };
}
