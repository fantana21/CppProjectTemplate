# CppProjectTemplate

This is Fantana's CppProjectTemplate. It is based on
[cmake-init](https://github.com/friendlyanon/cmake-init) and adapted to our needs and
preferences. The following is a non-exhaustive list of changes.

- Use PascalCase for C++ and CMake files as well as directories.
- Split up top-level `CMakeLists.txt` to define target properties close to the source.
- Rework `CMakePresets.json`. The hierarchy, names, and some settings are changed a bit
  and `Ninja Multi-Config` is used as the default generator. Most importantly though
  developer presets and more Windows presets are added. There are CI presets for two
  different compilers on both Windows and Ubuntu now. Moving the developer presets to
  `CMakePresets.json` was mostly for convenience. They do require additional setup for
  Windows in form of custom toolchains and triplets, though. At any rate, users are still
  expected to add `CMakeUsersPresets.json`, even if it is just for creating shorter
  aliases. Finally, build presets are added for all configuration presets that use
  multi-config generators.
- Increase minimum required CMake version and get rid of some code that became obsolete
  because of that.
- Use [doctest](https://github.com/doctest/doctest) instead of
  [Catch2](https://github.com/catchorg/Catch2).
- Rename linter scripts and targets since they only format.
- Add scripts and targets for formatting CMake code with
  [cmake-format](https://cmake-format.readthedocs.io/en/latest/cmake-format.html). There
  are now six format-related targets: `format[-cpp|-cmake][-fix]`
- Remove `Docs` folder and everything related to Code documentation apart from the
  top-level Markdown files.
- Provide `add_and_set_up_xxx()` functions which wrap most boilerplate code that appears
  when adding targets. Libraries, e.g., get a target name prefix, an export name and an
  alias according to best practices. The functions also allow to easily set properties,
  like include directories and compile features for all targets.
- Support [ccache](https://ccache.dev/) and
  [clang-tidy-cache](https://github.com/matus-chochlik/ctcache). The options
  `CppProjectTemplate_ENABLE_CCACHE` and `CppProjectTemplate_ENABLE_CLANG_TIDY_CACHE` are
  `ON` by default.
- Adapt configuration files for clang-format and clang-tidy to personal preferences. Also,
  add a separate clang-tidy configuration for tests, because magic numbers, e.g., are very
  common and not an issue there.
- Change a few names, descriptions, comments, and error messages.


# Building and installing

See the [BUILDING](BUILDING.md) document. If you are a developer check out
[HACKING.md](HACKING.md).


# Licensing

See the [LICENSE](LICENSE) document.
