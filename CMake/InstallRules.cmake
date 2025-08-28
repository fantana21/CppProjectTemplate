include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# The name of the package used in find_package()
set(package CppProjectTemplate)

install(
    TARGETS CppProjectTemplate_Main CppProjectTemplate_Person CppProjectTemplate_Square
    EXPORT ${package}Targets
    # cmake-format: off
    FILE_SET HEADERS COMPONENT CppProjectTemplate_Development
    # cmake-format: on
    RUNTIME COMPONENT CppProjectTemplate_Runtime
    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}/${package}" #
            COMPONENT CppProjectTemplate_Development
)

# Allow package maintainers to freely override the path for the configs
set(CppProjectTemplate_INSTALL_CMAKEDIR
    "${CMAKE_INSTALL_DATADIR}/${package}"
    CACHE PATH "Location of CMake package config files relative to the install prefix"
)
mark_as_advanced(CppProjectTemplate_INSTALL_CMAKEDIR)

install(
    FILES "CMake/PackageConfig.cmake"
    DESTINATION ${CppProjectTemplate_INSTALL_CMAKEDIR}
    RENAME "${package}Config.cmake"
    COMPONENT CppProjectTemplate_Development
)

write_basic_package_version_file(
    "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    VERSION ${CMAKE_PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION ${CppProjectTemplate_INSTALL_CMAKEDIR}
    COMPONENT CppProjectTemplate_Development
)

install(
    EXPORT ${package}Targets
    DESTINATION ${CppProjectTemplate_INSTALL_CMAKEDIR}
    NAMESPACE CppProjectTemplate::
    COMPONENT CppProjectTemplate_Development
)
