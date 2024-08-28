target_sources(CppProjectTemplate_Library PRIVATE Library.cpp)
target_sources(
    CppProjectTemplate_Library
    PUBLIC FILE_SET HEADERS FILES Library.hpp BASE_DIRS "${PROJECT_SOURCE_DIR}"
)
target_link_libraries(CppProjectTemplate_Library PRIVATE fmt::fmt)

target_sources(
    CppProjectTemplate_Square
    INTERFACE FILE_SET HEADERS FILES Square.hpp BASE_DIRS "${PROJECT_SOURCE_DIR}"
)

target_sources(CppProjectTemplate_Main PRIVATE Main.cpp)
target_link_libraries(
    CppProjectTemplate_Main
    PRIVATE CppProjectTemplate::Library CppProjectTemplate::Square NamedType QuantNd::QuantNd
)
