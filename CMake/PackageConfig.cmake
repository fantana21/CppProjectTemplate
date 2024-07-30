include(CMakeFindDependencyMacro)

find_dependency(fmt)
find_dependency(NamedType)

include(${CMAKE_CURRENT_LIST_DIR}/CppProjectTemplateTargets.cmake)
