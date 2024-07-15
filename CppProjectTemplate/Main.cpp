#include <CppProjectTemplate/Library.hpp>
#include <CppProjectTemplate/Square.hpp>

#include <iostream>


auto main() -> int
{
    auto const library = Library{};
    auto const message = "Hello from " + library.Name() + "!";
    std::cout << message << '\n';
    std::cout << "Square(2) = " << Square(2) << "\n";
    return 0;
}
