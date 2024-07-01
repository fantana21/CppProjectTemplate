install(TARGETS CppProjectTemplate_Main RUNTIME COMPONENT CppProjectTemplate_Runtime)

if(PROJECT_IS_TOP_LEVEL)
    include(CPack)
endif()
