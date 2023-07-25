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

@testset "Boilerplate" begin
    @assert 1 == 1
end
