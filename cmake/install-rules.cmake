install(
    TARGETS BullseyeFireControlSystem_exe
    RUNTIME COMPONENT BullseyeFireControlSystem_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
