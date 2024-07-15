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
include(CMake/PropertiesForAllTargets.cmake)

# ---- Find dependencies ----

find_package(fmt CONFIG REQUIRED)

# ---- Declare targets ----

add_library(CppProjectTemplate_Library STATIC)
set_property(TARGET CppProjectTemplate_Library PROPERTY EXPORT_NAME Library)
add_library(CppProjectTemplate::Library ALIAS CppProjectTemplate_Library)

add_executable(CppProjectTemplate_Main)
set_property(TARGET CppProjectTemplate_Main PROPERTY OUTPUT_NAME CppProjectTemplate)

all_targets_compile_features(cxx_std_20)
all_targets_include_directories("$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>")

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
