"""
    constants.jl

# Description
This file contains a collection of constants used in the `Rocket.jl` package.
"""

# -----------------------------------------------------------------------------
# CONSTANTS
# -----------------------------------------------------------------------------

"""
A constant defining the default input length for constructing [`RocketModule`](@ref)s in the empty constructor.
"""
const ROCKET_DEFAULT_INPUT_LENGTH = 5

"""
A constant defining the default number of kernels for constructing [`RocketModule`](@ref)s in the empty constructor.
"""
const ROCKET_DEFAULT_N_KERNELS = 100
