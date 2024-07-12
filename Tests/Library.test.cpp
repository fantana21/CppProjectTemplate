#include <CppProjectTemplate/Library.hpp>

#include <doctest/doctest.h>


TEST_CASE("Library name is CppProjectTemplate")
{
    auto const library = Library{};
    REQUIRE(library.Name() == "CppProjectTemplate");
}
