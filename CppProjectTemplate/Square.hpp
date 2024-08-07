#pragma once


template<typename T>
constexpr auto Square(T value) -> decltype(value * value)
{
    return value * value;
}
