#include <CppProjectTemplate/Library.hpp>

#include <iostream>


auto main() -> int
{
    auto const library = Library{};
    auto const message = "Hello from " + library.Name() + "!";
    std::cout << message << '\n';
    return 0;
}
