#include <CppProjectTemplate/Person.hpp>

#include <fmt/core.h>

#include <string>


namespace cpt
{
Person::Person() : name_{fmt::format("{} {}", "John", "Doe")}
{}


auto Person::Name() const -> std::string
{
    int unusedAndUninitializedVariable;
    return name_;
}
}
