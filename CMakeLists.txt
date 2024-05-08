cmake_minimum_required(VERSION 3.28)

include(CMake/Prelude.cmake)

project(
    BullseyeFireControlSystem
    VERSION 0.1.0
    DESCRIPTION "A fire control system for the Bullseye project"
    HOMEPAGE_URL "https://github.com/fantana21/BullseyeFireControlSystem"
    LANGUAGES CXX
)

include(CMake/ProjectIsTopLevel.cmake)
include(CMake/Variables.cmake)

# ---- Find dependencies ----

find_package(fmt REQUIRED)

# ---- Declare library ----

add_library(
    BullseyeFireControlSystem_Lib OBJECT
    BullseyeFireControlSystem/Lib.cpp
)

target_include_directories(
    BullseyeFireControlSystem_Lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>"
)

target_compile_features(BullseyeFireControlSystem_Lib PUBLIC cxx_std_20)

target_link_libraries(BullseyeFireControlSystem_Lib PRIVATE fmt::fmt)

# ---- Declare executable ----

add_executable(BullseyeFireControlSystem_Exe BullseyeFireControlSystem/main.cpp)
set_property(TARGET BullseyeFireControlSystem_Exe PROPERTY OUTPUT_NAME BullseyeFireControlSystem)
target_compile_features(BullseyeFireControlSystem_Exe PRIVATE cxx_std_20)
target_link_libraries(BullseyeFireControlSystem_Exe PRIVATE BullseyeFireControlSystem_Lib)

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
