#include <CppProjectTemplate/Square.hpp>

#include <doctest/doctest.h>


TEST_CASE("Square")
{
    CHECK(Square(0) == 0);
    CHECK(Square(1.0F) == 1.0F);
    CHECK(Square(17.3) == 17.3 * 17.3);
    CHECK(Square(-2000) == 4'000'000);
}
