# This file contains user options and variables. Developer-specific options and variables should be
# placed in CMake/DeveloperMode.cmake.

if(PROJECT_IS_TOP_LEVEL)
    # Developer mode enables targets and code paths in the CMake scripts that are only relevant for
    # the developer(s) of CppProjectTemplate. Targets necessary to build the project must be
    # provided unconditionally, so consumers can trivially build and package the project.
    option(CppProjectTemplate_DEVELOPER_MODE "Enable developer mode" OFF)

    option(CppProjectTemplate_ENABLE_CCACHE "Speed up recompilation with ccache" ON)
    if(CppProjectTemplate_ENABLE_CCACHE)
        include(CMake/CCache.cmake)
    endif()
endif()

# ---- Warning guard ----

# target_include_directories() with the SYSTEM modifier will request the compiler to omit warnings
# from the provided paths, if the compiler supports that. This is to provide a user experience
# similar to find_package() when add_subdirectory() or FetchContent() is used to consume this
# project.
set(warning_guard "")
if(NOT PROJECT_IS_TOP_LEVEL)
    option(
        CppProjectTemplate_INCLUDES_WITH_SYSTEM
        "Use SYSTEM modifier for CppProjectTemplate's includes, disabling warnings"
        ON
    )
    mark_as_advanced(CppProjectTemplate_INCLUDES_WITH_SYSTEM)
    if(CppProjectTemplate_INCLUDES_WITH_SYSTEM)
        set(warning_guard SYSTEM)
    endif()
endif()
