# Full featured ffmpeg build and installer script for macOS

- Minimum required dependencies: Xcode
- Installs all depdencies for a full featured ffmpeg build using Homebrew.
	- Installs Homebrew if it is not installed.
- Installs Apple Developer Command Line tools which includes Audiotoolbox and Videotoolbox libraries for GPU hardware accelerated decoding and encoding. 
- Installs dependencies for ffmpeg and configures ffmpeg with bzlib, frei0r, gnutls, gcrypt, gmp, libbs2b, libdc1394, libfdk-aac, libfontconfig, libfreetype, libgsm, libilbc, libbluray, libkvazaar, libmp3lame, libopenh264, libopus, libpulse, libsnappy, libspeex, libtheora, version3, libvorbis, libvpx, libwavpack, libwebp, libx264, libx265, libxvid, libzmq, opengl, openal, opencl, zlib, nonfree, gpl, videotoolbox, audiotoolboxm features and mmx, mmxext, avx, avx2, sse, sse2, sse3, ssse3, sse4, and sse42 instructions, and compiles with link time optimization.
- It will then do a multithreaded build of ffmpeg, leveraging all cpu threads.
- Note that this build script requires a Core i7 with the AVX2 instruction set.
