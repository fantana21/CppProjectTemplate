#include <CppProjectTemplate/Library.hpp>
#include <CppProjectTemplate/Square.hpp>

#include <NamedType/named_type_impl.hpp>
#include <NamedType/underlying_functionalities.hpp>
#include <QuantNd/Utility.hpp>

#include <iostream>


namespace
{
using Number = fluent::NamedType<int, struct NumberTag, fluent::Addable, fluent::Printable>;


auto Increment(Number number) -> Number
{
    return number + Number(1);
}
}


auto main() -> int
{
    try
    {
        auto const library = cpt::Library{};
        auto const message = "Hello from " + library.Name() + "!";
        std::cout << message << "\n";
        std::cout << "Square(2) = " << cpt::Square(2) << "\n";
        auto const number = Number(41);
        std::cout << Increment(number) << "\n";
        std::cout << "quantnd::allAreEqual<1, 1, 1> = " << quantnd::allAreEqual<1, 1, 1> << "\n";
        auto aaa = 1U;
        auto bbb = 2;
        auto ccc = aaa + bbb;
    }
    catch(...)
    {
        return 1;
    }
    return 0;
}
