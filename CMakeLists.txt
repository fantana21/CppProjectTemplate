cmake_minimum_required(VERSION 3.31)

include(CMake/InSourceBuildGuard.cmake)
include(CMake/MetadataFromVcpkg.cmake)

project(
    CppProjectTemplate
    VERSION ${version_from_vcpkg}
    DESCRIPTION ${description_from_vcpkg}
    HOMEPAGE_URL ${homepage_from_vcpkg}
    LANGUAGES CXX
)

include(CMake/LanguageStandard.cmake)
include(CMake/OptionsAndVariables.cmake)
include(CMake/AddAndSetUpTargets.cmake)

# ---- Find dependencies ----

find_package(fmt CONFIG REQUIRED)
find_package(NamedType CONFIG REQUIRED)
find_package(QuantNd CONFIG REQUIRED)

# ---- Declare targets ----

add_and_set_up_executable(CppProjectTemplate_App)
add_and_set_up_library(CppProjectTemplate_Person STATIC)
add_and_set_up_library(CppProjectTemplate_Square INTERFACE)

add_subdirectory(CppProjectTemplate)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
    include(CMake/InstallRules.cmake)
endif()

# ---- Developer mode ----

if(NOT CppProjectTemplate_DEVELOPER_MODE)
    return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
    message(AUTHOR_WARNING "Developer mode is intended for developers of CppProjectTemplate")
endif()

include(CMake/DeveloperMode.cmake)
