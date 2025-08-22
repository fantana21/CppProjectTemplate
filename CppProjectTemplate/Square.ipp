#pragma once

// IWYU pragma: private, include <CppProjectTemplate/Square.hpp>
#include <CppProjectTemplate/Square.hpp>


namespace cpt
{
template<typename T>
constexpr auto Square(T value) -> decltype(value * value)
{
    return value * value;
}
}
