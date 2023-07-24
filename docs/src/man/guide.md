# [Package Guide](@id package-guide)

To work with the `Rocket.jl` package, you should know:

- [How to install the package](@ref installation)
- [How to create and use a RocketModule](@ref module)
- [How to save and load](@ref save-load)

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
Pkg.add("AdaptiveResonance")
```

If you wish to have the latest changes between releases, you can directly add the GitHub repo at an arbitrary branch (such as `develop`) as a dependency with

```julia-repl
julia> ]
(@v1.9) pkg> add https://github.com/AP6YC/Rocket.jl#develop
```

## [Instantiation and Usage](@id module)

asdf

## [Saving and Loading](@id save-load)

To use the package, import the project

```julia
# Im
using Rocket

# Test saving and loading
filepath = "my_rocket"

# Create the rocket module
my_rocket = Rocket.RocketModule()

# Save the module to the filepath
MetaICVI.Rocket.save_rocket(my_rocket, filepath)

# Test that the file exists
@test isfile(filepath)

# Load the rocket module
my_new_rocket = MetaICVI.Rocket.load_rocket(filepath)

# Delete the saved file
rm(filepath)
```