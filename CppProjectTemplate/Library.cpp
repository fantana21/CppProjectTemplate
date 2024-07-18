#include <CppProjectTemplate/Library.hpp>

#include <fmt/core.h>


Library::Library() : name_{fmt::format("{}", "CppProjectTemplate")}
{}


auto Library::Name() const -> std::string
{
    return name_;
}
