#include <doctest/doctest.h>

#include "Lib.hpp"

TEST_CASE("Name is BullseyeFireControlSystem", "[library]")
{
  auto const lib = library {};
  REQUIRE(lib.name == "BullseyeFireControlSystem");
}
