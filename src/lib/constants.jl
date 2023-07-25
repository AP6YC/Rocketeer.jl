"""
    constants.jl

# Description
This file contains a collection of constants used in the `Rocket.jl` package.
"""

# -----------------------------------------------------------------------------
# CONSTANTS
# -----------------------------------------------------------------------------

"""
Common docstring: description of attribution for the Rocket module for inclusion in relevant docstrings.
"""
const DOCSTRING_ATTRIBUTION = """
# Attribution

## Programmer

- Sasha Petrenko <petrenkos@mst.edu> [@AP6YC](https://github.com/AP6YC)

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

- Papers:
    - [Journal article](https://link.springer.com/article/10.1007/s10618-020-00701-z) ([DOI](https://doi.org/10.1007/s10618-020-00701-z))
    - [Preprint](https://arxiv.org/abs/1910.13051)
- Software
    - [rocket](https://github.com/angus924/rocket) (Python)
"""

"""
A constant defining the default input length for constructing [`RocketModule`](@ref)s in the empty constructor.
"""
const ROCKET_DEFAULT_INPUT_LENGTH = 5

"""
A constant defining the default number of kernels for constructing [`RocketModule`](@ref)s in the empty constructor.
"""
const ROCKET_DEFAULT_N_KERNELS = 100
