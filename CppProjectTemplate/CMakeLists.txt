target_sources(CppProjectTemplate_App PRIVATE Main.cpp)
target_link_libraries(
    CppProjectTemplate_App
    PRIVATE CppProjectTemplate::Person CppProjectTemplate::Square NamedType QuantNd::QuantNd
)

target_sources(CppProjectTemplate_Person PRIVATE Person.cpp)
target_sources(
    CppProjectTemplate_Person
    PUBLIC FILE_SET HEADERS FILES Person.hpp BASE_DIRS "${PROJECT_SOURCE_DIR}"
)
target_link_libraries(CppProjectTemplate_Person PRIVATE fmt::fmt)

target_sources(
    CppProjectTemplate_Square
    INTERFACE FILE_SET HEADERS FILES Square.hpp BASE_DIRS "${PROJECT_SOURCE_DIR}"
)
