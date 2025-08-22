#pragma once

#include <string>


namespace cpt
{
//! @brief The core implementation of the executable
//!
//! This class makes up the library part of the executable, which means that the main logic is
//! implemented here. This kind of separation makes it easy to test the implementation for the
//! executable, because the logic is nicely separated from the command-line logic implemented in the
//! main function.
class Library
{
public:
    //! @brief Simply initializes the library name to the name of the project
    Library();
    //! @brief Returns the library name
    [[nodiscard]] auto Name() const -> std::string;

private:
    std::string name_;
};
}
