include(CMake/Folders.cmake)

include(CTest)
if(BUILD_TESTING)
  add_subdirectory(test)
endif()

add_custom_target(
    run-exe
    COMMAND BullseyeFireControlSystem_exe
    VERBATIM
)
add_dependencies(run-exe BullseyeFireControlSystem_exe)

option(BUILD_MCSS_DOCS "Build documentation using Doxygen and m.css" OFF)
if(BUILD_MCSS_DOCS)
  include(CMake/Docs.cmake)
endif()

option(ENABLE_COVERAGE "Enable coverage support separate from CTest's" OFF)
if(ENABLE_COVERAGE)
  include(CMake/Coverage.cmake)
endif()

include(CMake/LintTargets.cmake)
include(CMake/SpellTargets.cmake)

add_folders(Project)
