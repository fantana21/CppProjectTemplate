# Add a library, set its export name (name without prefix), include directories and C++ standard,
# and create an alias target.
#
# add_and_set_up_library(<name> <type>)
function(add_and_set_up_library name type)
    _split_off_prefix(${name} prefix name_without_prefix)
    add_library(${name} ${type})
    set_property(TARGET ${name} PROPERTY EXPORT_NAME ${name_without_prefix})
    if(prefix)
        add_library(${prefix}::${name_without_prefix} ALIAS ${name})
    endif()
    if(type STREQUAL INTERFACE)
        set(scope INTERFACE)
    else()
        set(scope PUBLIC)
    endif()
    _set_include_directories_and_cxx_standard(${name} ${scope})
endfunction()

# Add an executable and set its output name, include directories, and C++ standard.
#
# - Default output name: <name-without-prefix>
#
# add_and_set_up_executable(<name> [OUTPUT_NAME <output_name>])
function(add_and_set_up_executable name)
    cmake_parse_arguments(THE "" "OUTPUT_NAME" "" ${ARGN})
    _split_off_prefix(${name} prefix name_without_prefix)
    add_executable(${name})
    if(NOT THE_OUTPUT_NAME)
        set(THE_OUTPUT_NAME ${name_without_prefix})
    endif()
    set_property(TARGET ${name} PROPERTY OUTPUT_NAME ${THE_OUTPUT_NAME})
    _set_include_directories_and_cxx_standard(${name} PRIVATE)
endfunction()

# Add a test executable and set its output name, sources, include directories, and C++ standard.
#
# - Default output name: <name-without-prefix>Test
# - Default sources: <name-without-prefix>.test.cpp
#
# add_and_set_up_test(<name> [OUTPUT_NAME <output_name>] [SOURCES <sources>...])
function(add_and_set_up_test name)
    cmake_parse_arguments(THE "" "OUTPUT_NAME" "SOURCES" ${ARGN})
    _split_off_prefix(${name} prefix name_without_prefix)
    if(NOT THE_SOURCES)
        set(THE_SOURCES ${name_without_prefix}.test.cpp)
    endif()
    add_executable(${name} ${THE_SOURCES})
    if(NOT THE_OUTPUT_NAME)
        set(THE_OUTPUT_NAME ${name_without_prefix}Test)
    endif()
    set_property(TARGET ${name} PROPERTY OUTPUT_NAME ${THE_OUTPUT_NAME})
    _set_include_directories_and_cxx_standard(${name} PRIVATE)
endfunction()

function(_split_off_prefix string prefix rest)
    string(FIND ${string} "_" position)
    if(position EQUAL -1)
        set(prefix_ "")
        set(rest_ ${string})
    else()
        string(SUBSTRING ${string} 0 ${position} prefix_)
        math(EXPR position "${position} + 1")
        string(SUBSTRING ${string} ${position} -1 rest_)
    endif()
    set(${prefix} ${prefix_} PARENT_SCOPE)
    set(${rest} ${rest_} PARENT_SCOPE)
endfunction()

function(_set_include_directories_and_cxx_standard target scope)
    target_include_directories(
        ${target} ${warning_guard} ${scope} "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>"
    )
    target_compile_features(${target} ${scope} cxx_std_20)
    set_property(TARGET ${target} PROPERTY CXX_EXTENSIONS OFF)
endfunction()
