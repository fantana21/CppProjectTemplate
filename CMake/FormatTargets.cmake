add_custom_target(
    format-cpp-check
    COMMAND "${CMAKE_COMMAND}" -P "${PROJECT_SOURCE_DIR}/CMake/FormatCpp.cmake"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Checking code format"
    VERBATIM
)

add_custom_target(
    format-cpp-fix
    COMMAND "${CMAKE_COMMAND}" -D FIX=YES -P "${PROJECT_SOURCE_DIR}/CMake/FormatCpp.cmake"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Fixing code format"
    VERBATIM
)

add_custom_target(
    format-cmake-check
    COMMAND "${CMAKE_COMMAND}" -P "${PROJECT_SOURCE_DIR}/CMake/FormatCMake.cmake"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Checking code format"
    VERBATIM
)

add_custom_target(
    format-cmake-fix
    COMMAND "${CMAKE_COMMAND}" -D FIX=YES -P "${PROJECT_SOURCE_DIR}/CMake/FormatCMake.cmake"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Fixing code format"
    VERBATIM
)

add_custom_target(
    format-check
    COMMAND "${CMAKE_COMMAND}" -P "${PROJECT_SOURCE_DIR}/CMake/Format.cmake"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Checking code format"
    VERBATIM
)

add_custom_target(
    format-fix
    COMMAND "${CMAKE_COMMAND}" -D FIX=YES -P "${PROJECT_SOURCE_DIR}/CMake/Format.cmake"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Fixing code format"
    VERBATIM
)
