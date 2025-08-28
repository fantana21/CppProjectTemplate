#pragma once

#include <string>


namespace cpt
{
class Person
{
public:
    Person();
    [[nodiscard]] auto Name() const -> std::string;

private:
    std::string name_;
};
}
