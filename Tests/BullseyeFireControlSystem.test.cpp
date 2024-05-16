#include <BullseyeFireControlSystem/Lib.hpp>

#include <doctest/doctest.h>


TEST_CASE("Library name is BullseyeFireControlSystem")
{
    auto const library = Library{};
    REQUIRE(library.Name() == "BullseyeFireControlSystem");
}
