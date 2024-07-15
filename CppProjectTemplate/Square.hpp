template<typename T>
auto Square(T value) -> decltype(value * value)
{
    return value * value;
}
