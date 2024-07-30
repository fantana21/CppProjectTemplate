# Building with CMake

This document is intended for users of the project. If you are a developer, please refer
to [HACKING.md](HACKING.md).

The dependencies of this project are defined in [vcpkg.json](vcpkg.json). Assuming all of
them are installed properly we can build this project with the usual CMake commands.

~~~shell
# Single config generators like Ninja
cmake -S . -B build -G Ninja -D CMAKE_BUILD_TYPE=Release
cmake --build build
# Multi config generators like Ninja Multi-Config
cmake -S . -B build -G "Ninja Multi-Config"
cmake --build build --config Release
~~~

Note that MSVC by default is not standards compliant, and you need to pass some flags to
make it behave properly. See the `flags-msvc` preset in the
[CMakePresets.json](CMakePresets.json) file for those flags.

After building, we can install the project with the following canonical commands.

~~~shell
# Single config generators
cmake --install build
# Multi config generators
cmake --install build --config Release
~~~
