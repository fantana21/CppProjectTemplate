cmake_minimum_required(VERSION 3.14)

macro(default name)
    if(NOT DEFINED "${name}")
        set("${name}" "${ARGN}")
    endif()
endmacro()

default(FIX NO)
if(FIX)
    set(flag --in-place)
else()
    set(flag --check)
endif()

set(files_and_directories "CMakeLists.txt" "CMake/" "CppProjectTemplate/" "Tests/")
message("Formatting the following files and directories:")
foreach(entry IN LISTS files_and_directories)
    message("  ${entry}")
endforeach()

execute_process(
    # TODO: Treat warnings as errors?
    COMMAND gersemi ${flag} ${files_and_directories}
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    RESULT_VARIABLE result
    ERROR_VARIABLE error_output
)

if(NOT FIX AND NOT (result EQUAL "0" OR result EQUAL "1"))
    message("${error_output}")
    message(FATAL_ERROR "'${file}': formatter returned with ${result}")
endif()

if(NOT FIX AND result EQUAL "1")
    string(REGEX MATCHALL "([^\n\r]+) would be reformatted" reformatted_lines "${error_output}")
    set(badly_formatted_files "")
    foreach(line IN LISTS reformatted_lines)
        string(REGEX REPLACE "^(.+) would be reformatted$" "\\1" file "${line}")
        file(RELATIVE_PATH file "${CMAKE_SOURCE_DIR}" "${file}")
        list(APPEND badly_formatted_files "${file}")
    endforeach()
    list(JOIN badly_formatted_files "\n" bad_list)
    message("The following files are badly formatted:\n\n${bad_list}\n")
    message(FATAL_ERROR "Run again with FIX=YES to fix these files.")
endif()
