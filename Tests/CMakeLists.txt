# ---- Dependencies ----

find_package(Catch2 CONFIG REQUIRED)
include(Catch)

# ---- Tests ----

add_fantana_test(CppProjectTemplateTests_Person)
target_link_libraries(
    CppProjectTemplateTests_Person
    PRIVATE Catch2::Catch2WithMain CppProjectTemplate::Person
)
catch_discover_tests(CppProjectTemplateTests_Person)

add_fantana_test(CppProjectTemplateTests_Square)
target_link_libraries(
    CppProjectTemplateTests_Square
    PRIVATE Catch2::Catch2WithMain CppProjectTemplate::Square
)
catch_discover_tests(CppProjectTemplateTests_Square)

# ---- End-of-file commands ----

add_folder(Tests)
