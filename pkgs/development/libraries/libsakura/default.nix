{ fetchurl,  stdenv, cmake, eigen, fftw , fftwSinglePrec}:

# See also https://github.com/pkgw/conda-recipes/tree/master/recipes/libsakura

stdenv.mkDerivation rec {
  version = "1.1.1";
  name = "libsakura-${version}";

  buildInputs = [ cmake eigen fftw fftwSinglePrec] ;
  src = fetchurl {
    url = "https://svn.cv.nrao.edu/casa/devel/${name}.tar.gz";
    sha256 ="1aa4hwhm78i18kyfpxnb8fr4nh5y6kcanc473l9fk5xplihpccqx";
  };

  preConfigure = ''
        cmakeFlagsArray=( -DCMAKE_MODULE_PATH="$NIX_BUILD_TOP/${name}/cmake-modules" );
    '';  

  cmakeFlagsArray =  [  ];


  meta = {

    homepage = http://alma.mtk.nao.ac.jp/j/;

    license = stdenv.lib.licenses.lgpl3;
  };
}
