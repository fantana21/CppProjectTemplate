include(CMakeFindDependencyMacro)

find_dependency(fmt)
find_dependency(NamedType)
find_dependency(QuantNd)

include(${CMAKE_CURRENT_LIST_DIR}/CppProjectTemplateTargets.cmake)
