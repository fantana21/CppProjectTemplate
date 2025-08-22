#include <CppProjectTemplate/Square.hpp>

#include <doctest/doctest.h>


TEST_CASE("Square")
{
    CHECK(cpt::Square(0) == 0);
    CHECK(cpt::Square(1.0F) == 1.0F);
    CHECK(cpt::Square(17.3) == 17.3 * 17.3);
    CHECK(cpt::Square(-2000) == 4'000'000);
}
