// function_object.h
// Unary predicate to identify negative values
#pragma once
#include <functional>

template <class T> class is_negative: public std::unary_function<T, bool>
{
  public:
  result_type operator()(const T& value) const
  {
    return value<0;
  }
};
