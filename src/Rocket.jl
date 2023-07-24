"""
Main module for the `Rocket.jl` method.

# Attribution

## Programmer

- Sasha Petrenko <petrenkos@mst.edu> @AP6YC

## Original Authors

- Angus Dempster
- Francois Petitjean
- Geoff Webb

## Bibtex Entry

```bibtex
@article{dempster_etal_2020,
    author  = {Dempster, Angus and Petitjean, Francois and Webb, Geoffrey I},
    title   = {ROCKET: Exceptionally fast and accurate time classification using random convolutional kernels},
    year    = {2020},
    journal = {Data Mining and Knowledge Discovery},
    doi     = {https://doi.org/10.1007/s10618-020-00701-z}
}
```

## Citation Links

- [preprint](https://arxiv.org/abs/1910.13051)
- [DOI](https://doi.org/10.1007/s10618-020-00701-z)

# Imports

The following names are imported by the package as dependencies:
$(IMPORTS)

# Exports

The following names are exported and available when `using` the package:
$(EXPORTS)
"""
module Rocket

# -----------------------------------------------------------------------------
# DEPENDENCIES
# -----------------------------------------------------------------------------

# Full usings (which supports comma-separated import notation)
using
    DocStringExtensions,
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
@precompile_signatures(Rocket)

end
