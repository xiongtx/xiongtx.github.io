---
layout: post
title: Compile-time vs. runtime with C++ templates
excerpt: Keeping track of what happens when can be tricky
---

I've been brushing up on C++ via the excellent [Learn C++](https://www.learncpp.com/) online resource, and found templates to be one of the most interesting aspects of the language[^1].

Templates are C++'s implementation of generic programming, but rather than rely on dynamic dispatch like [Java](https://docs.oracle.com/javase/tutorial/java/generics/types.html), C++ uses compile-time code generation. This means that C++ generics don't incur runtime overhead, at the cost of larger program size--a tradeoff that the performance-conscious C++ community is usually willing to make.

One  difficulty with templates is having to think about what happens at compile time vs. runtime. Consider the following:

```c++
#include <iostream>

template<unsigned int N>
unsigned int sum() {
    if (N == 1) {
        return 1;
    }
    return N + sum<N-1>();
};

int main() {
    std::cout << sum<10>() << std::endl;

    return 0;
}
```

This seems like it should work, but it actually fails to compile:

> fatal error: recursive template instantiation exceeded maximum depth of 1024

The problem is that `if (N == 1)` is evaluated at _runtime_, not _compile time_. Therefore, template instantiation sees `sum<10>`, `sum<9>`, etc., until it gets to `sum<0>`, after which it wraps around to the largest value of `unsigned int`.

To properly terminate the recursion at compile time we can either define the base case as a separate function using [template specialization](https://www.learncpp.com/cpp-tutorial/function-template-specialization/):

```c++
template<unsigned int N>
unsigned int sum() {
    return N + sum<N-1>();
};

template<>
unsigned int sum<1>() {
    return 1;
};
```

Or, in C++17 and above, use [`if constexpr`](https://en.cppreference.com/w/cpp/language/if.html#Constexpr_if):

```c++
template<unsigned int N>
unsigned int sum() {
    if constexpr (N == 1) {
        return 1;
    } else {
        return N + sum<N - 1>();
    }
};
```

The magic of `if constexpr` is that it _discards the other branch_ at compile time:

> If _condition_ yields `true`, then _statement-false_ is discarded (if present), otherwise, _statement-true_ is discarded.

So template instantiation never sees the `else` branch when `N == 1`, which means there's no infinite recursion.

Note that `if constexpr` only works when there are two branches. The following does _not_ work:

```c++
template<unsigned int N>
unsigned int sum() {
    if constexpr (N == 1) {
        return 1;
    }
    return N + sum<N - 1>();
};
```

The `return N + sum<N - 1>();` is not in the `else` branch, so it's not discarded.

[^1]: The C++ community certainly agrees, as evidenced by the enduring popularity of [Modern C++ Design](https://www.amazon.com/Modern-Design-Generic-Programming-Patterns/dp/0201704315), a book that puts templates at the heart of C++ design patterns.
