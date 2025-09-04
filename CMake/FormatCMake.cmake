cmake_minimum_required(VERSION 3.14)

if(NOT DEFINED FIX)
    set(FIX NO)
endif()

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
    COMMAND gersemi ${flag} --warnings-as-errors --no-cache ${files_and_directories}
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    RESULT_VARIABLE result
    ERROR_VARIABLE error_output
)

if(result EQUAL "0")
    return()
endif()

if(NOT result EQUAL "1" OR (result EQUAL "1" AND error_output MATCHES "Warning: "))
    message("${error_output}")
    message(FATAL_ERROR "CMake formatter returned ${result}")
endif()

# If we have no warnings, only some badly formatted files, print them in a nice list with the same
# formatting as FormatCpp.cmake
if(NOT FIX)
    string(REGEX MATCHALL "([^\n\r]+) would be reformatted" reformatted_lines "${error_output}")
    foreach(line IN LISTS reformatted_lines)
        string(REGEX REPLACE "^(.+) would be reformatted$" "\\1" file "${line}")
        list(APPEND badly_formatted_files "${file}")
    endforeach()
    if(badly_formatted_files)
        list(JOIN badly_formatted_files "\n  " bad_list)
        message("The following files are badly formatted:")
        message("  ${bad_list}\n")
        message(FATAL_ERROR "Run again with FIX=YES to fix these files.")
    endif()
endif()
