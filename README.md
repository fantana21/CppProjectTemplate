# CppProjectTemplate

This is the CppProjectTemplate project. It is based on
[cmake-init](https://github.com/friendlyanon/cmake-init). The following is a
non-exhaustive list of changes.

- Use PascalCase for C++ and CMake files
- Split up top-level `CMakeLists.txt` to define target properties close to the source
- WIP: Rework `CMakePresets.json`
- Increase minimum required CMake version and get rid of some code that became obsolete
  because of that
- Use [doctest](https://github.com/doctest/doctest) instead of
  [Catch2](https://github.com/catchorg/Catch2)
- Rename linter scripts and targets since they only format
- Add scripts and targets for formatting CMake code with
  [cmake-format](https://cmake-format.readthedocs.io/en/latest/cmake-format.html). There
  are now the six format-related targets: `format[-cpp|-cmake][-fix]`
- Remove `Docs` folder and everything related to Code documentation apart from the
  top-level Markdown files.
- Provide `add_and_set_up_xxx()` functions which wrap most boilerplate code that appears
  when adding targets. Libraries, e.g., get a target name prefix, an export name and an
  alias according to best practices. The functions also allow to easily set properties,
  like include directories and compile features for all targets.
- Adapt configuration files for clang-format and clang-tidy to personal preferences. Also
  add a separate clang-tidy configuration for tests, because magic numbers, e.g., are very
  common and not an issue there.
- Change a few names, descriptions, comments, and error messages


# Building and installing

See the [BUILDING](BUILDING.md) document.

# Contributing

See the [CONTRIBUTING](CONTRIBUTING.md) document.

# Licensing

<!--
Please go to https://choosealicense.com/licenses/ and choose a license that
fits your needs. The recommended license for a project of this type is the
GNU AGPLv3.
-->
