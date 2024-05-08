include(CMake/Folders.cmake)

include(CTest)
if(BUILD_TESTING)
  add_subdirectory(Tests)
endif()

add_custom_target(
    run-exe
    COMMAND BullseyeFireControlSystem_Exe
    VERBATIM
)
add_dependencies(run-exe BullseyeFireControlSystem_Exe)

option(ENABLE_COVERAGE "Enable coverage support separate from CTest's" OFF)
if(ENABLE_COVERAGE)
  include(CMake/Coverage.cmake)
endif()

include(CMake/LintTargets.cmake)
include(CMake/SpellTargets.cmake)

add_folders(Project)
