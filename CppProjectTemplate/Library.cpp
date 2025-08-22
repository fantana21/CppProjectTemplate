#include <CppProjectTemplate/Library.hpp>

#include <fmt/core.h>

#include <string>


namespace cpt
{
Library::Library() : name_{fmt::format("{}", "CppProjectTemplate")}
{}


auto Library::Name() const -> std::string
{
    int unusedAndUninizialiedVariable;
    return name_;
}
}
