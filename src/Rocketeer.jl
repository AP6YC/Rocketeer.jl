"""
    Rocketeer.jl

# Description
Main file implementing the `Rocketeer` module.
"""

"""
Main module for the `Rocketeer.jl` package.

$(DOCSTRING_ATTRIBUTION)

# Imports

The following names are imported by the package as dependencies:
$(IMPORTS)

# Exports

The following names are exported and available when `using` the package:
$(EXPORTS)
"""
module Rocketeer

# -----------------------------------------------------------------------------
# DEPENDENCIES
# -----------------------------------------------------------------------------

# Full usings (which supports comma-separated import notation)
using
    DocStringExtensions,
    Pkg,
    Random,
    NumericalTypeAliases

# Colon syntax broken into new lines
using JLD2: save_object, load_object
using StatsBase: sample
using PrecompileSignatures: @precompile_signatures  # Precompile concrete type methods

# -----------------------------------------------------------------------------
# INCLUDES
# -----------------------------------------------------------------------------

# Aggregated library code
include("lib/lib.jl")

# -----------------------------------------------------------------------------
# EXPORTS
# -----------------------------------------------------------------------------

# Export relevant names
export
    # Constants
    ROCKET_VERSION,

    # Structs
    RocketKernel,
    RocketModule,

    # Methods
    apply_kernel,
    apply_kernels,
    load_rocket,
    save_rocket

# -----------------------------------------------------------------------------
# PRECOMPILE
# -----------------------------------------------------------------------------

# Precompile any concrete-type function signatures
@precompile_signatures(Rocketeer)

end
