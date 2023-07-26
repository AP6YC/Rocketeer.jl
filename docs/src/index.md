```@meta
DocTestSetup = quote
    using Rocket, Dates
end
```

![header](assets/downloads/header.png)

---

These pages serve as the official documentation for the `Rocket.jl` Julia package.

The purpose of this package is to implement the [Rocket](https://doi.org/10.1007/s10618-020-00701-z) method in the [Julia](https://julialang.org/) programming language.

This project is not programmed by the original authors of the original paper; please see the [Attribution](@ref attribution) section for more details on the original paper and software.

If you wish to contribute to the project, please see the [Contributing](@ref) guide.
The public API is listed in the [Index](@ref main-index), while the internal API is listed in the [Developer Index](@ref dev-main-index).

## Manual Outline

This documentation is split into the following sections:

```@contents
Pages = [
    "man/guide.md",
    "../examples/index.md",
    "man/contributing.md",
    "man/full-index.md",
    "man/dev-index.md",
]
Depth = 1
```

## [Attribution](@id attribution)

### Authors

This package is a [`Julia`](https://julialang.org/) implementation of the [Rocket](https://doi.org/10.1007/s10618-020-00701-z) method.

This package itself is developed and maintained by [Sasha Petrenko](https://github.com/AP6YC) with sponsorship by the [Applied Computational Intelligence Laboratory (ACIL)](https://acil.mst.edu/).
If you simply have suggestions for improvement, Sasha Petrenko (<petrenkos@mst.edu>) is the current developer and maintainer of the `Rocket.jl` package, so please feel free to reach out with thoughts and questions.

The original paper is authored by:

- Angus Dempster
- Francois Petitjean
- Geoff Webb

The links for the original work are:

- Papers:
  - [Journal article](https://link.springer.com/article/10.1007/s10618-020-00701-z) ([DOI](https://doi.org/10.1007/s10618-020-00701-z))
  - [Preprint](https://arxiv.org/abs/1910.13051)
- Software:
  - [rocket](https://github.com/angus924/rocket) (Python)

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

### Funding

This research was sponsored by the Army Research Laboratory and was accomplished under Cooperative Agreement Number W911NF-22-2-0209.
The views and conclusions contained in this document are those of the authors and should not be interpreted as representing the official policies, either expressed or implied, of the Army Research Laboratory or the U.S. Government.
The U.S. Government is authorized to reproduce and distribute reprints for Government purposes notwithstanding any copyright notation herein.

## Documentation Build

This documentation was built using [Documenter.jl](https://github.com/JuliaDocs/Documenter.jl) with the following version and OS:

```@example
using Rocket, Dates # hide
println("Rocket v$(ROCKET_VERSION) docs built $(Dates.now()) with Julia $(VERSION) on $(Sys.KERNEL)") # hide
```
