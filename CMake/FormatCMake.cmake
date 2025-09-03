cmake_minimum_required(VERSION 3.14)

macro(default name)
    if(NOT DEFINED "${name}")
        set("${name}" "${ARGN}")
    endif()
endmacro()

default(FIX NO)
if(FIX)
    set(flag --in-place)
    set(action "Formatting")
else()
    set(flag --check)
    set(action "Checking")
endif()

set(files_and_directories
    "${CMAKE_SOURCE_DIR}/CMakeLists.txt"
    "${CMAKE_SOURCE_DIR}/CMake/"
    "${CMAKE_SOURCE_DIR}/CppProjectTemplate/"
    "${CMAKE_SOURCE_DIR}/Tests/"
)
list(JOIN files_and_directories "\n  " files_and_directories_list)
message("${action} the following CMake files and directories:")
message("  ${files_and_directories_list}\n")

execute_process(
    # TODO: Treat warnings as errors?
    COMMAND gersemi ${flag} ${files_and_directories}
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    RESULT_VARIABLE result
    ERROR_VARIABLE error_output
)

if(NOT FIX AND NOT (result EQUAL "0" OR result EQUAL "1"))
    message("${error_output}")
    message(FATAL_ERROR "CMake formatter returned ${result}")
endif()

if(NOT FIX AND result EQUAL "1")
    string(REGEX MATCHALL "([^\n\r]+) would be reformatted" reformatted_lines "${error_output}")
    set(badly_formatted_files "")
    foreach(line IN LISTS reformatted_lines)
        string(REGEX REPLACE "^(.+) would be reformatted$" "\\1" file "${line}")
        list(APPEND badly_formatted_files "${file}")
    endforeach()
    list(JOIN badly_formatted_files "\n  " bad_list)
    message("The following files are badly formatted:")
    message("  ${bad_list}\n")
    message(FATAL_ERROR "Run again with FIX=YES to fix these files.")
endif()
