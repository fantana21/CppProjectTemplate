#include <iostream>
#include <string>

#include "Lib.hpp"

auto main() -> int
{
  auto const lib = library {};
  auto const message = "Hello from " + lib.name + "!";
  std::cout << message << '\n';
  return 0;
}
