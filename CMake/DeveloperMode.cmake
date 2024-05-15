include(CMake/Folders.cmake)

include(CTest)
if(BUILD_TESTING)
  add_subdirectory(Tests)
endif()

option(ENABLE_COVERAGE "Enable coverage support separate from CTest's" OFF)
if(ENABLE_COVERAGE)
  include(CMake/Coverage.cmake)
endif()

include(CMake/FormatTargets.cmake)
include(CMake/SpellTargets.cmake)

add_folders(Project)
