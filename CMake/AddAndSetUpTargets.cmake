function(set_include_directories_and_cxx_standard target scope)
    target_include_directories(${target} ${scope} "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>")
    target_compile_features(${target} ${scope} cxx_std_20)
    set_property(TARGET ${target} PROPERTY CXX_EXTENSIONS OFF)
endfunction()

# Add a library with PROJECT_NAME prefix, set its export name, include directories and C++ standard,
# and create an alias target.
#
# add_and_set_up_library(<name> <type>)
function(add_and_set_up_library name type)
    set(target ${PROJECT_NAME}_${name})
    add_library(${target} ${type})
    set_property(TARGET ${target} PROPERTY EXPORT_NAME ${name})
    add_library(${PROJECT_NAME}::${name} ALIAS ${target})
    if(type STREQUAL INTERFACE)
        set(scope INTERFACE)
    else()
        set(scope PUBLIC)
    endif()
    set_include_directories_and_cxx_standard(${target} ${scope})
endfunction()

# Add an executable with PROJECT_NAME prefix, and set its output name, include directories, and C++
# standard.
#
# add_and_set_up_executable(<name> [OUTPUT_NAME <output_name>])
function(add_and_set_up_executable name)
    cmake_parse_arguments(THE "" "OUTPUT_NAME" "" ${ARGN})
    set(target ${PROJECT_NAME}_${name})
    add_executable(${target})
    if(NOT THE_OUTPUT_NAME)
        set(THE_OUTPUT_NAME ${name})
    endif()
    set_property(TARGET ${target} PROPERTY OUTPUT_NAME ${THE_OUTPUT_NAME})
    set_include_directories_and_cxx_standard(${target} PRIVATE)
endfunction()

# Add a test executable with PROJECT_NAME prefix, and set its output name, sources, include
# directories, and C++ standard.
#
# add_and_set_up_test(<name> [OUTPUT_NAME <output_name>] [SOURCES <sources>...])
function(add_and_set_up_test name)
    cmake_parse_arguments(THE "" "OUTPUT_NAME" "SOURCES" ${ARGN})
    set(target ${PROJECT_NAME}_${name})
    if(NOT THE_SOURCES)
        set(THE_SOURCES ${name}.test.cpp)
    endif()
    add_executable(${target} ${THE_SOURCES})
    if(NOT THE_OUTPUT_NAME)
        set(THE_OUTPUT_NAME ${name}Test)
    endif()
    set_property(TARGET ${target} PROPERTY OUTPUT_NAME ${THE_OUTPUT_NAME})
    set_include_directories_and_cxx_standard(${target} PRIVATE)
endfunction()
