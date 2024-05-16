#include <BullseyeFireControlSystem/Library.hpp>

#include <fmt/core.h>


Library::Library() : name_{fmt::format("{}", "BullseyeFireControlSystem")}
{
}


auto Library::Name() const -> std::string
{
    return name_;
}
