cmake_minimum_required(VERSION 3.28)

include(CMake/Prelude.cmake)

project(
    CppProjectTemplate
    VERSION 0.1.0
    DESCRIPTION "Based on cmake-init but with PascalCase, doctest, cmake-format, ..."
    HOMEPAGE_URL "https://github.com/fantana21/CppProjectTemplate"
    LANGUAGES CXX
)

include(CMake/OptionsAndVariables.cmake)
include(CMake/AddAndSetUpTargets.cmake)

# ---- Find dependencies ----

find_package(fmt CONFIG REQUIRED)

# ---- Declare targets ----

add_and_set_up_library(Library STATIC)
add_and_set_up_library(Square INTERFACE)
add_and_set_up_executable(Main OUTPUT_NAME CppProjectTemplate)

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
