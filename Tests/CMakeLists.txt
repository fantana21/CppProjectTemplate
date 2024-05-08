# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(BullseyeFireControlSystemTests LANGUAGES CXX)

# ---- Dependencies ----

find_package(doctest REQUIRED)
include(doctest)
include(../cmake/DoctestWithMain.cmake)

# ---- Tests ----

add_executable(BullseyeFireControlSystem_test BullseyeFireControlSystem.test.cpp)
target_link_libraries(
    BullseyeFireControlSystem_test PRIVATE
    BullseyeFireControlSystem::Lib
    doctest::doctestWithMain
)

doctest_discover_tests(BullseyeFireControlSystem_test)

# ---- End-of-file commands ----

add_folders(Tests)
