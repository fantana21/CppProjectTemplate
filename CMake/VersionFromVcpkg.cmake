file(READ vcpkg.json vcpkg_json)
string(JSON version_from_vcpkg GET "${vcpkg_json}" version-semver)
message("Project version: ${version_from_vcpkg}")
