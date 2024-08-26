cmake_minimum_required(VERSION 3.29)

include(CMake/Prelude.cmake)

project(
    CppProjectTemplate
    VERSION 1.1.0
    DESCRIPTION "Based on cmake-init but adapted to our needs and preferences"
    HOMEPAGE_URL "https://github.com/fantana21/CppProjectTemplate"
    LANGUAGES CXX
)

include(CMake/OptionsAndVariables.cmake)
include(CMake/AddAndSetUpTargets.cmake)

# ---- Find dependencies ----

find_package(fmt CONFIG REQUIRED)
find_package(NamedType CONFIG REQUIRED)
find_package(QuantNd CONFIG REQUIRED)

# ---- Declare targets ----

add_and_set_up_library(CppProjectTemplate_Library STATIC)
add_and_set_up_library(CppProjectTemplate_Square INTERFACE)
add_and_set_up_executable(CppProjectTemplate_Main)

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
