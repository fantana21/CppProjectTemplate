#include <CppProjectTemplate/Library.hpp>
#include <CppProjectTemplate/Square.hpp>

#include <iostream>
#include <string>


auto main() -> int
{
    try
    {
        auto const library = Library{};
        auto const message = "Hello from " + library.Name() + "!";
        std::cout << message << '\n';
        std::cout << "Square(2) = " << Square(2) << "\n";
    }
    catch(...)
    {
        return 1;
    }
    return 0;
}
