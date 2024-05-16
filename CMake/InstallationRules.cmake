install(TARGETS BullseyeFireControlSystem_Main RUNTIME COMPONENT BullseyeFireControlSystem_Runtime)

if(PROJECT_IS_TOP_LEVEL)
    include(CPack)
endif()
