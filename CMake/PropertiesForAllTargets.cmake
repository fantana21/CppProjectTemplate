function(all_targets_include_directories include_directories)
    get_property(
        target_names
        DIRECTORY ${PROJECT_SOURCE_DIR}
        PROPERTY BUILDSYSTEM_TARGETS
    )
    message("Setting include directories to ${include_directories} for targets:")
    foreach(target IN LISTS target_names)
        message("- ${target}")
        get_target_property(type ${target} TYPE)
        if(type STREQUAL INTERFACE_LIBRARY)
            target_include_directories(${target} ${warning_guard} INTERFACE ${include_directories})
        else()
            target_include_directories(${target} ${warning_guard} PUBLIC ${include_directories})
        endif()
    endforeach()
endfunction()

function(all_targets_compile_features compile_features)
    get_property(
        target_names
        DIRECTORY ${PROJECT_SOURCE_DIR}
        PROPERTY BUILDSYSTEM_TARGETS
    )
    message("Setting compile features to ${compile_features} for targets:")
    foreach(target IN LISTS target_names)
        message("- ${target}")
        get_target_property(type ${target} TYPE)
        if(type STREQUAL INTERFACE_LIBRARY)
            target_compile_features(${target} INTERFACE ${compile_features})
        else()
            target_compile_features(${target} PUBLIC ${compile_features})
        endif()
    endforeach()
endfunction()