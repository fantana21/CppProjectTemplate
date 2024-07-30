# Hacking

Here is some wisdom to help you build and test this project as a developer. If you are a
user and just want to build and install the project, please refer to
[BUILDING.md](BUILDING.md).


## Developer mode

Build system targets that are only useful for developers of this project are hidden if the
`CppProjectTemplate_DEVELOPER_MODE` option is disabled. Enabling this option makes tests
and other developer targets and options available. Not enabling this option means that you
are a consumer of this project, and thus you have no need for these targets and options.

Developer mode is always set to on in CI workflows.


## Presets

This project makes use of
[presets](https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html) to simplify the
process of configuring the project. You are recommended to always have the latest CMake
version installed to make use of the latest quality-of-life additions. (The same goes for
compilers and other tools.)

As a developer, you should create a `CMakeUserPresets.json` file at the root of the
project. To get you started more quickly
[`CMakeDeveloperPresets.json`](CMakeDeveloperPresets.json) already contains a convenient
set of configure, build, test, and workflow presets for you. Just include it in your
user preset file and optionally create aliases with shorter names for those you use
often. The following shows an example `CMakeUserPresets.json`.

<details>
<summary>CMakeUserPresets.json</summary>

~~~json
{
  "version": 6,
  "cmakeMinimumRequired": {
    "major": 3,
    "minor": 25,
    "patch": 0
  },
  "include": [
    "CMakeDeveloperPresets.json"
  ],
  "configurePresets": [
    {
      "name": "dev",
      "inherits": "dev-windows-clang-cl"
    }
  ],
  "buildPresets": [
    {
      "name": "dev-debug",
      "inherits": "dev-windows-clang-cl-debug",
      "configurePreset": "dev"
    },
    {
      "name": "dev-release",
      "inherits": "dev-windows-clang-cl-release",
      "configurePreset": "dev"
    }
  ],
  "testPresets": [
    {
      "name": "dev",
      "configurePreset": "dev"
    }
  ],
  "workflowPresets": [
    {
      "name": "dev",
      "steps": [
        {
          "type": "configure",
          "name": "dev"
        },
        {
          "type": "build",
          "name": "dev-debug"
        },
        {
          "type": "test",
          "name": "dev"
        },
        {
          "type": "build",
          "name": "dev-release"
        },
        {
          "type": "test",
          "name": "dev"
        }
      ]
    }
  ]
}
~~~

</details>

`CMakeUserPresets.json` is also the perfect place in which you can put all sorts of things
that you would otherwise want to pass to the configure command in the terminal.

**Note for Windows developers**: The developer presets for Windows make use of custom
toolchain files from
[MarkSchofield/WindowsToolchain](https://github.com/MarkSchofield/WindowsToolchain) as
well as overlay triplets for vcpkg from
[Neumann-A/my-vcpkg-triplets](https://github.com/Neumann-A/my-vcpkg-triplets). To use them
clone both repositories. Then set the environment variable `WINDOWS_TOOLCHAIN_ROOT` to
point to the directory with the toolchain files and add the path to the triplet repository
to
[`VCPKG_OVERLAY_TRIPLETS`](https://learn.microsoft.com/en-us/vcpkg/users/config-environment#vcpkg_overlay_triplets).


## Dependency manager

The presets make use of the [vcpkg](https://github.com/microsoft/vcpkg) dependency
manager. After installing it, make sure the `VCPKG_ROOT` environment variable is pointing
at the directory where the vcpkg executable is.


## Configure, build and test

If you followed the above instructions, then you can configure, build and test the project
respectively with the following commands from the project root.

~~~shell
cmake --preset dev
cmake --build --preset dev-debug
ctest --preset dev
~~~

To configure, build and test both the debug and release configuration in one step you can
use a workflow preset.

~~~shell
cmake --workflow --preset dev
~~~

Note that both builds and tests can be run in parallel using multiple threads. The ninja
build tool automatically uses all available cores. To run tests in parallel either specify
the command line option `-j/--parallel`, set the `jobs` property in your preset, or set
the environment variable
[`CTEST_PARALLEL_LEVEL`](https://cmake.org/cmake/help/latest/envvar/CTEST_PARALLEL_LEVEL.html).


## Developer mode targets

These are targets you may invoke using the build command from above, with an additional
`-t <target>` flag.


### `coverage`

Available if `ENABLE_COVERAGE` is enabled. This target processes the output of the
previously run tests when built with coverage configuration. It generates plain text,
Markdown, HTML, and XML coverage reports. See [Coverage.cmake](CMake/Coverage.cmake) for
more details. Note that this target currently only works on Linux. On Windows I have yet
to figure out how to tell the linker where to find `clang_rt.profile-x86_64.lib`.


### `format-check` and `format-fix`

These targets run the clang-format and cmake-format tools on the codebase to check
formatting errors and to fix them respectively. See
[`FormatCpp.cmake`](CMake/FormatCpp.cmake) and
[`FormatCMake.cmake`](CMake/FormatCMake.cmake) for more details.


### `spell-check` and `spell-fix`

These targets run the codespell tool on the codebase to check errors and to fix them
respectively. See [`Spell.cmake`](CMake/Spell.cmake) for more details.
