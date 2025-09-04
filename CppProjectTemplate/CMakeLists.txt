target_sources(CppProjectTemplate_App PRIVATE Main.cpp)
target_link_libraries(
    CppProjectTemplate_App
    PRIVATE CppProjectTemplate::Person CppProjectTemplate::Square NamedType QuantNd::QuantNd
)

target_sources(
    CppProjectTemplate_Person
    PRIVATE Person.cpp
    PUBLIC FILE_SET HEADERS BASE_DIRS "${PROJECT_SOURCE_DIR}" FILES Person.hpp
)
target_link_libraries(CppProjectTemplate_Person PRIVATE fmt::fmt)

target_sources(
    CppProjectTemplate_Square
    INTERFACE FILE_SET HEADERS BASE_DIRS "${PROJECT_SOURCE_DIR}" FILES Square.hpp
)
