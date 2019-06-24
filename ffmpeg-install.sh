#!/bin/bash
# A full featured ffmpeg build and install script
#
# 1) First, the script installs Apple Developer Command Line Tools if it is not already installed
# 2) Next, the script installs Homebrew if it is not already installed, then it proceeds to install all dependencies.
# 3) Last, the script will build ffmpeg for macOS from GitHub source
# This script is designed for a Core i7 CPU with the AVX2 instruction set
 
sudo xcode-select --install &> /dev/null

if [ ! -x `which brew` ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install bzip2
if [ ${?} -gt 0 ]; then
    brew upgrade bzip2
fi
brew install frei0r
if [ ${?} -gt 0 ]; then
    brew upgrade frei0r
fi
brew install gnutls
if [ ${?} -gt 0 ]; then
    brew upgrade gnutls
fi
brew install libgcrypt
if [ ${?} -gt 0 ]; then
    brew upgrade libgcrypt
fi
brew install gmp
if [ ${?} -gt 0 ]; then
    brew upgrade gmp
fi
brew install libbs2b
if [ ${?} -gt 0 ]; then
    brew upgrade libbs2b
fi
brew install libdc1394
if [ ${?} -gt 0 ]; then
    brew upgrade libdc1394
fi
brew install faac
if [ ${?} -gt 0 ]; then
    brew upgrade faac
fi
brew install faad2
if [ ${?} -gt 0 ]; then
    brew upgrade faad2
fi
brew install fontconfig
if [ ${?} -gt 0 ]; then
    brew upgrade fontconfig
fi
brew install freetype
if [ ${?} -gt 0 ]; then
    brew upgrade freetype
fi
brew install libgsm
if [ ${?} -gt 0 ]; then
    brew upgrade libgsm
fi
brew install libilbc
if [ ${?} -gt 0 ]; then
    brew upgrade libilbc
fi
brew install libbluray
if [ ${?} -gt 0 ]; then
    brew upgrade libbluray
fi
brew install kvazaar
if [ ${?} -gt 0 ]; then
    brew upgrade kvazaar
fi
brew install lame
if [ ${?} -gt 0 ]; then
    brew upgrade lame
fi
brew install openh264
if [ ${?} -gt 0 ]; then
    brew upgrade openh264
fi
brew install libopusenc
if [ ${?} -gt 0 ]; then
    brew upgrade libopusenc
fi
brew install pulseaudio
if [ ${?} -gt 0 ]; then
    brew upgrade pulseaudio
fi
brew install snappy
if [ ${?} -gt 0 ]; then
    brew upgrade snappy
fi
brew install speex
if [ ${?} -gt 0 ]; then
    brew upgrade speex
fi
brew install theora
if [ ${?} -gt 0 ]; then
    brew upgrade theora
fi
brew install libvorbis
if [ ${?} -gt 0 ]; then
    brew upgrade libvorbis
fi
brew install libvpx
if [ ${?} -gt 0 ]; then
    brew upgrade libvpx
fi
brew install wavpack
if [ ${?} -gt 0 ]; then
    brew upgrade wavpack
fi
brew install webp
if [ ${?} -gt 0 ]; then
    brew upgrade webp
fi
brew install x264
if [ ${?} -gt 0 ]; then
    brew upgrade x264
fi
brew install x265
if [ ${?} -gt 0 ]; then
    brew upgrade x265
fi
brew install openh264
if [ ${?} -gt 0 ]; then
    brew upgrade openh264
fi
brew install xvid
if [ ${?} -gt 0 ]; then
    brew upgrade xvid
fi
brew install zeromq
if [ ${?} -gt 0 ]; then
    brew upgrade zeromq
fi
brew install openal-soft
if [ ${?} -gt 0 ]; then
    brew upgrade openal-soft
fi
brew install zlib
if [ ${?} -gt 0 ]; then
    brew upgrade zlib
fi
brew install openjpeg
if [ ${?} -gt 0 ]; then
    brew upgrade openjpeg
fi
brew install fdk-aac
if [ ${?} -gt 0 ]; then
    brew upgrade fdk-aac
fi
brew install fdk-aac-encoder
if [ ${?} -gt 0 ]; then
    brew upgrade fdk-aac-encoder
fi
brew install yasm
if [ ${?} -gt 0 ]; then
    brew upgrade yasm
fi
brew install ffmpeg --only-dependencies
brew uninstall --ignore-dependencies ffmpeg
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
./configure --prefix=/usr/local --enable-bzlib --enable-frei0r --enable-gnutls --enable-gcrypt --enable-gmp --enable-libbs2b --enable-libdc1394 --enable-libfdk-aac --enable-libfontconfig --enable-libfreetype --enable-libgsm --enable-libilbc --enable-libbluray --enable-libkvazaar --enable-libmp3lame --enable-libopenh264 --enable-libopus --enable-libpulse --enable-libsnappy --enable-libspeex --enable-libtheora --enable-version3 --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxvid --enable-libzmq --enable-opengl --enable-openal --enable-opencl --enable-zlib --enable-nonfree --enable-gpl --enable-videotoolbox --enable-audiotoolbox --arch=x86_64 --cpu=corei7-avx --extra-cflags='-I/usr/include -I/usr/local/include -I/usr/local/include/openjpeg-2.2 -I/usr/local/opt/openal-soft/include -g0 -O3 -arch x86_64 -mtune=corei7-avx -march=corei7-avx' --extra-cxxflags='-I/usr/include -I/usr/local/include -I/usr/local/include/openjpeg-2.2 -I/usr/local/opt/openal-soft/include -std=c++14 -g0 -O3 -arch x86_64 -mtune=corei7-avx -march=corei7-avx' --extra-ldflags='-L/usr/include -L/usr/local/lib -L/usr/local/opt/openal-soft/lib -O3 -arch x86_64' --disable-debug --assert-level=0 --enable-mmx --enable-mmxext --enable-avx --enable-avx2 --enable-sse --enable-sse2 --enable-sse3 --enable-ssse3 --enable-sse4 --enable-sse42 --enable-lto
export NUMCPUS=`python -c 'import multiprocessing as mp; print(mp.cpu_count())'`
make -j${NUMCPUS} && sudo make install
exit 0
