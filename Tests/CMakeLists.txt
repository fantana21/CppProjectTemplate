# Parent project does not export its library target, so this CML implicitly depends on being added
# from it, i.e. the testing is done only from the build tree and is not feasible from an install
# location

project(CppProjectTemplateTests LANGUAGES CXX)

# ---- Dependencies ----

find_package(doctest CONFIG REQUIRED)
include(doctest)
include(../CMake/DoctestWithMain.cmake)

# ---- Tests ----

add_and_set_up_test(CppProjectTemplateTests_Library)
target_link_libraries(
    CppProjectTemplateTests_Library PRIVATE CppProjectTemplate::Library doctest::doctestWithMain
)
doctest_discover_tests(CppProjectTemplateTests_Library)

add_and_set_up_test(CppProjectTemplateTests_Square)
target_link_libraries(
    CppProjectTemplateTests_Square PRIVATE CppProjectTemplate::Square doctest::doctestWithMain
)
doctest_discover_tests(CppProjectTemplateTests_Square)

# ---- End-of-file commands ----

add_folders(Tests)
