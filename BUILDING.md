# Building with CMake

This document is intended for users of the project. If you are a developer, please refer
to [HACKING.md](HACKING.md).


## Cloning the Repository

This project uses Git submodules. The following are the essential commands for working with them:

~~~shell
# Clone the repository with all submodules
git clone --recurse-submodules <repository-url>

# Pull changes for main repository and all submodules
git pull --recurse-submodules

# Manually initialize and update all submodules (if not using --recurse-submodules above)
git submodule update --init --recursive
~~~


## Building

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

If you want vcpkg to automatically install the dependencies in the configure step, you
need to use the vcpkg toolchain file. See the `vcpkg` preset in the
[CMakePresets.json](CMakePresets.json) file for details.

Note that MSVC by default is not standards compliant, and you need to pass some flags to
make it behave properly. See the `flags-msvc` preset in the
[CMakePresets.json](CMakePresets.json) file for those flags.

After a successful build, we can install the project with the following canonical
commands.

~~~shell
# Single config generators
cmake --install build
# Multi config generators
cmake --install build --config Release
~~~
