#include <doctest/doctest.h>

#include <BullseyeFireControlSystem/Lib.hpp>

TEST_CASE("Name is BullseyeFireControlSystem")
{
  auto const lib = library {};
  REQUIRE(lib.name == "BullseyeFireControlSystem");
}
