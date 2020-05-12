# CMake toolchain file for cross compiling x265 for ARM arch
# This feature is only supported as experimental. Use with caution.
# Please report bugs on bitbucket
# Run cmake with: cmake -DCMAKE_TOOLCHAIN_FILE=crosscompile.cmake -G "Unix Makefiles" ../../source && ccmake ../../source

set(CMAKE_VERBOSE_MAKEFILE ON)


set(CROSS_COMPILE_ARM 1)
set(CMAKE_SYSTEM_NAME QNX)
set(CMAKE_SYSTEM_PROCESSOR ARMV7L)

# please apt-get install mingw-w64
#set(CMAKE_RC_COMPILER /usr/bin/x86_64-w64-mingw32-windres)

# specify the cross compiler
set(CMAKE_C_COMPILER $ENV{QNX_HOST}/usr/bin/arm-unknown-nto-qnx7.0.0eabi-gcc)

set(CMAKE_CXX_COMPILER $ENV{QNX_HOST}/usr/bin/arm-unknown-nto-qnx7.0.0eabi-g++)

set(CMAKE_ASM_COMPILER $ENV{QNX_HOST}/usr/bin/arm-unknown-nto-qnx7.0.0eabi-as)
set(CMAKE_ASM_DEFINE_FLAG "-Wa,--defsym,")

set(CMAKE_RANLIB $ENV{QNX_HOST}/usr/bin/arm-unknown-nto-qnx7.0.0eabi-ranlib
    CACHE PATH "QNX ranlib Program" FORCE)
set(CMAKE_AR $ENV{QNX_HOST}/usr/bin/arm-unknown-nto-qnx7.0.0eabi-ar
    CACHE PATH "QNX qr Program" FORCE)

# specify the target environment
SET(CMAKE_FIND_ROOT_PATH  ${QNX_TARGET}/armle-v7)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

