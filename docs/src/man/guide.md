# [Package Guide](@id package-guide)

To work with the `Rocket.jl` package, you should know:

- [An overview of what this package is and does](@ref overview)
- [How to install the package](@ref installation)
- [How to create and use a RocketModule](@ref module)
- [How to save and load](@ref save-load)

## [Overview](@id overview)

This package implements a module that generates a set of randomly distributed kernels for extracting features on a time series dataset for classification with some other machine learning method.

**What this package is**:

A package for generating, applying, saving, and loading these random feature kernels.

**What this package is not**:

This package does not implement any machine learning (i.e., parameter updating) methods themselves for learning upon these feature on the back end, nor does it implement any data manipulation tools on the front end.
These you are responsible depending upon your application ("batteries not included").

## [Installation](@id installation)

The `Rocket.jl` package can be installed using the Julia package manager.
From the Julia REPL, type `]` to enter the Pkg REPL mode and run

```julia-repl
julia> ]
(@v1.9) pkg> add Rocket
```

Alternatively, it can be added to your environment in a script with

```julia
using Pkg
Pkg.add("Rocket")
```

If you wish to have the latest changes between releases, you can directly add the GitHub repo at an arbitrary branch (such as `develop`) as a dependency with

```julia-repl
julia> ]
(@v1.9) pkg> add https://github.com/AP6YC/Rocket.jl#develop
```

## [Instantiation and Usage](@id module)

After installation, load the package in a script in the usual Julia pattern (with either `using` or `import`):

```julia
# `using` brings all exported names into this scope
using Rocket

# `import` just brings the module name itself
import Rocket
```

Create a `RocketModule` with the following hyperparameters:

1. `input_length`: the expected window length of the input data.
This is used to determine the distribution of the depth of the kernels.
2. `n_kernels`: the number of

like so:

```julia
my_rocket = RocketModule(input_length, n_kernels)
```

Input data is assumed to be a vector of `Real` numbers, such as those created when calling `rand`:

```julia
X = rand(input_length)
```

To apply the kernels and extract their features, simply call `apply_kernels` upon the `RocketModule` and your data:

```julia
features = apply_kernels(my_rocket, X)
```

This results in a feature set of dimension `(n_kernels, 2)` due to the way that the Rocket kernel features are defined.
For more details, please see the [original paper](https://doi.org/10.1007/s10618-020-00701-z).

## [Saving and Loading](@id save-load)

This package implements two functions for convenient saving and loading of the `RocketModule`.
To save a set of kernels for later reuse, simple use `save_rocket`:

```julia
filename = "my_rocket_file"
save_rocket(my_rocket, filename)
```

and load with `load_rocket`:

```julia
my_loaded_rocket = load_rocket(filename)
```

These two use [`JLD2.jl`](https://github.com/JuliaIO/JLD2.jl) under the hood.
You can also choose to save the `RocketModule` with any other package, as the stateful information of the module is implemented with native Julia types (e.g., `Vector`s of `Real` numbers, etc.) that have well-defined serializations for saving and loading.
