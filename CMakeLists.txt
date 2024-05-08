cmake_minimum_required(VERSION 3.14)

include(CMake/Prelude.cmake)

project(
    BullseyeFireControlSystem
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(CMake/ProjectIsTopLevel.cmake)
include(CMake/Variables.cmake)

# ---- Declare library ----

add_library(
    BullseyeFireControlSystem_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    BullseyeFireControlSystem_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(BullseyeFireControlSystem_lib PUBLIC cxx_std_20)

find_package(fmt REQUIRED)
target_link_libraries(BullseyeFireControlSystem_lib PRIVATE fmt::fmt)

# ---- Declare executable ----

add_executable(BullseyeFireControlSystem_exe source/main.cpp)
add_executable(BullseyeFireControlSystem::exe ALIAS BullseyeFireControlSystem_exe)

set_property(TARGET BullseyeFireControlSystem_exe PROPERTY OUTPUT_NAME BullseyeFireControlSystem)

target_compile_features(BullseyeFireControlSystem_exe PRIVATE cxx_std_20)

target_link_libraries(BullseyeFireControlSystem_exe PRIVATE BullseyeFireControlSystem_lib)

# ---- Install rules ----

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

include(CMake/DevMode.cmake)
