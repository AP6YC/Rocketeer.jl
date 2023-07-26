"""
    test_sets.jl

# Description
The main collection of tests for the `Rocket.jl` package.
This file loads common utilities and aggregates all other unit tests files.
"""

# -----------------------------------------------------------------------------
# PREAMBLE
# -----------------------------------------------------------------------------

## Load the modules into the current context
using
    JLD2,       # for saving and loading
    Rocket      # this package

# -----------------------------------------------------------------------------
# ADDITIONAL DEPENDENCIES
# -----------------------------------------------------------------------------

using
    Logging,
    Test

# -----------------------------------------------------------------------------
# UNIT TESTS
# -----------------------------------------------------------------------------

@testset "Rocket" begin
    ## Save file name
    filepath = "my_rocket"
    ## Rocket and data hyper parameters
    input_length = 20
    n_kernels = 200

    try
        # Empty constructor
        my_rocket = RocketModule()
        # Parameterized constructor
        my_specific_rocket = RocketModule(input_length, n_kernels)
        # Save
        save_rocket(my_specific_rocket, filepath)
        # Load
        my_new_rocket = load_rocket(filepath)
        # Random data
        X = rand(input_length)
        # Apply kernels
        features = apply_kernels(my_rocket, X)
        features_specific = apply_kernels(my_new_rocket, X)

        # Assertions

        # Identity assertions
        @assert my_rocket isa RocketModule
        @assert my_new_rocket isa RocketModule
        @assert my_specific_rocket isa RocketModule
        @assert my_rocket.kernels isa Vector{RocketKernel}
        @assert all([my_rocket.kernels[ix] isa RocketKernel for ix = 1:length(my_rocket.kernels)])

        # Verify dimension of the features
        @assert size(features) == (100, 2)
        @assert size(features_specific) == (n_kernels, 2)
    finally
        # Remove the save file
        rm(filepath)
    end
end
