cmake_minimum_required(VERSION 3.28)

include(CMake/Prelude.cmake)

project(
    BullseyeFireControlSystem
    VERSION 0.1.0
    DESCRIPTION "A fire control system for the Bullseye project"
    HOMEPAGE_URL "https://github.com/fantana21/BullseyeFireControlSystem"
    LANGUAGES CXX
)

include(CMake/Variables.cmake)
include(CMake/PropertiesForAllTargets.cmake)

# ---- Find dependencies ----

find_package(fmt REQUIRED)

# ---- Declare targets ----

add_library(BullseyeFireControlSystem_Lib OBJECT)
add_library(BullseyeFireControlSystem::Lib ALIAS BullseyeFireControlSystem_Lib)
add_executable(BullseyeFireControlSystem_Exe)

all_targets_compile_features(cxx_std_20)
all_targets_include_directories("$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>")

add_subdirectory(BullseyeFireControlSystem)

# ---- Installation rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(CMake/InstallationRules.cmake)
endif()

# ---- Developer mode ----

if(NOT BullseyeFireControlSystem_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of BullseyeFireControlSystem"
  )
endif()

include(CMake/DeveloperMode.cmake)
