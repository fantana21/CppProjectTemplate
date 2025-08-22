#pragma once


namespace cpt
{
template<typename T>
constexpr auto Square(T value) -> decltype(value * value);
}


#include <CppProjectTemplate/Square.ipp>
