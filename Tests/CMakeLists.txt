# ---- Dependencies ----

find_package(doctest CONFIG REQUIRED)
include(doctest)
include(../CMake/DoctestWithMain.cmake)

# ---- Tests ----

add_and_set_up_test(CppProjectTemplateTests_Person)
target_link_libraries(
    CppProjectTemplateTests_Person PRIVATE CppProjectTemplate::Person doctest::doctestWithMain
)
doctest_discover_tests(CppProjectTemplateTests_Person)

add_and_set_up_test(CppProjectTemplateTests_Square)
target_link_libraries(
    CppProjectTemplateTests_Square PRIVATE CppProjectTemplate::Square doctest::doctestWithMain
)
doctest_discover_tests(CppProjectTemplateTests_Square)

# ---- End-of-file commands ----

add_folders(Tests)
