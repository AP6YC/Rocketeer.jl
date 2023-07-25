[![rocket-header](https://github.com/AP6YC/FileStorage/blob/main/Rocket/header.png?raw=true)][docs-dev-url]

A [Julia][julialang] implementation of the [Rocket][rocket-doi] method of using random feature kernels for time series classification.

This project is not programmed by the original authors of the original paper; please see the [Attribution](#attribution) section for more details.

| **Documentation** | **Coverage** | **CI Status** |
|:-----------------:|:------------:|:-------------:|
| [![Dev][docs-dev-img]][docs-dev-url] | [![Codecov][codecov-img]][codecov-url] | [![CI Status][ci-img]][ci-url] |
| [![Stable][docs-stable-img]][docs-stable-url] | [![Coveralls][coveralls-img]][coveralls-url] | [![Documentation][doc-status-img]][doc-status-url] |

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://AP6YC.github.io/Rocket.jl/stable

[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://AP6YC.github.io/Rocket.jl/dev

[doc-status-img]: https://github.com/AP6YC/Rocket.jl/actions/workflows/Documentation.yml/badge.svg
[doc-status-url]: https://github.com/AP6YC/Rocket.jl/actions/workflows/Documentation.yml

[ci-img]: https://github.com/AP6YC/Rocket.jl/workflows/CI/badge.svg
[ci-url]: https://github.com/AP6YC/Rocket.jl/actions?query=workflow%3ACI

[codecov-img]: https://codecov.io/gh/AP6YC/Rocket.jl/branch/main/graph/badge.svg
[codecov-url]: https://codecov.io/gh/AP6YC/Rocket.jl

[coveralls-img]: https://coveralls.io/repos/github/AP6YC/Rocket.jl/badge.svg?branch=main
[coveralls-url]: https://coveralls.io/github/AP6YC/Rocket.jl?branch=main

[julialang]: https://julialang.org/
[rocket-doi]: https://doi.org/10.1007/s10618-020-00701-z
[rocket-code]: https://github.com/angus924/rocket
[rocket-paper]: https://link.springer.com/article/10.1007/s10618-020-00701-z
[rocket-preprint]: https://arxiv.org/abs/1910.13051

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Usage](#usage)
- [Attribution](#attribution)
  - [Authors](#authors)
  - [Icons](#icons)

## Usage

For detailed usage instructions, please see the [Documentation][docs-dev-url].

To use the package, you must:

1. Load `Rocket`,
2. Create a `RocketModule` object (with optionally specified `input_length` and `n_kernels` hyperparameters),
3. `apply_kernels` to your dataset to extract the Rocket features,
4. Optionally `save_rocket` and `load_rocket` if you intend to utilize the exact same kernels in future experiments.

For example:

```julia
# Load the module
using Rocket

# Set some parameters of the example
filepath = "my_rocket"  # Point to a save file
input_length = 10       # The length of the input window
n_kernels = 200         # The number of kernels to generate

# Create a rocket module
my_rocket = RocketModule(input_length, n_kernels)

# Save it for future use
save_rocket(my_rocket, filepath)

# Load the module back into a new object
my_new_rocket = load_rocket(filepath)

# Create some random data
X = rand(input_length)

# Apply the kernels to get features
features = apply_kernels(my_new_rocket, X)
```

## Attribution

### Authors

This Julia package is programmed by:

- Sasha Petrenko <petrenkos@mst.edu> @AP6YC

The original paper is authored by:

- Angus Dempster
- Francois Petitjean
- Geoff Webb

The links for the original work are:

- Papers:
  - [Journal article][rocket-paper] ([DOI][rocket-doi])
  - [Preprint][rocket-preprint]
- Software:
  - [rocket][rocket-code] (Python)

The bibtex entry for the original paper is:

```bibtex
@article{dempster_etal_2020,
    author  = {Dempster, Angus and Petitjean, Francois and Webb, Geoffrey I},
    title   = {ROCKET: Exceptionally fast and accurate time classification using random convolutional kernels},
    year    = {2020},
    journal = {Data Mining and Knowledge Discovery},
    doi     = {https://doi.org/10.1007/s10618-020-00701-z}
}
```

### Icons

The icon used for the project logo is from the following:

- [Space shuttle icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/space-shuttle) ([startup_1067357](https://www.flaticon.com/free-icon/startup_1067357))
