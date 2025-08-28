#include <CppProjectTemplate/Person.hpp>

#include <doctest/doctest.h>


TEST_CASE("Person name is John Doe")
{
    auto const library = cpt::Person{};
    CHECK(library.Name() == "John Doe");
}
