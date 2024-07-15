# Add a library with PROJECT_NAME prefix, set its export name and include directories, and create an
# alias.
#
# add_and_set_up_library(<name> <type>)
function(add_and_set_up_library name type)
    set(target_name ${PROJECT_NAME}_${name})
    add_library(${target_name} ${type})
    set_property(TARGET ${target_name} PROPERTY EXPORT_NAME ${name})
    add_library(${PROJECT_NAME}::${name} ALIAS ${target_name})
    target_include_directories(${target_name} PUBLIC "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>")
endfunction()

# Add an executable with PROJECT_NAME prefix, and set its output name and include directories.
#
# add_and_set_up_executable(<name> [OUTPUT_NAME <output_name>])
function(add_and_set_up_executable name)
    cmake_parse_arguments(THE "" "OUTPUT_NAME" "" ${ARGN})
    set(target_name ${PROJECT_NAME}_${name})
    add_executable(${target_name})
    if(NOT THE_OUTPUT_NAME)
        set(THE_OUTPUT_NAME ${name})
    endif()
    set_property(TARGET ${target_name} PROPERTY OUTPUT_NAME ${THE_OUTPUT_NAME})
    target_include_directories(${target_name} PUBLIC "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>")
endfunction()

# Add a test executable with PROJECT_NAME prefix, and set its output name, sources and include
# directories.
#
# add_and_set_up_test(<name> [OUTPUT_NAME <output_name>] [SOURCES <sources>...])
function(add_and_set_up_test name)
    cmake_parse_arguments(THE "" "OUTPUT_NAME" "SOURCES" ${ARGN})
    set(target_name ${PROJECT_NAME}_${name})
    if(NOT THE_SOURCES)
        set(THE_SOURCES ${name}.test.cpp)
    endif()
    add_executable(${target_name} ${THE_SOURCES})
    if(NOT THE_OUTPUT_NAME)
        set(THE_OUTPUT_NAME ${name}Test)
    endif()
    set_property(TARGET ${target_name} PROPERTY OUTPUT_NAME ${THE_OUTPUT_NAME})
    target_include_directories(${target_name} PUBLIC "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>")
endfunction()
