"""
    version.jl

# Description
Borrowed from MLJ.jl, this defines the version of the package as a constant in the module.

# Authors
- Sasha Petrenko <petrenkos@mst.edu> [@AP6YC](https://github.com/AP6YC)

# Credits
- MLJ.jl: https://github.com/alan-turing-institute/MLJ.jl
"""

# -----------------------------------------------------------------------------
# CONSTANTS
# -----------------------------------------------------------------------------

"""
A constant that contains the version of the installed `Rocketeer.jl` package.

This value is computed at compile time, so it may be used to programmatically verify the version of `OAR` that is installed in case a `compat` entry in your Project.toml is missing or otherwise incorrect.
"""
const ROCKETEER_VERSION = VersionNumber(
    Pkg.TOML.parsefile(joinpath(dirname(@__DIR__), "..", "Project.toml"))["version"]
)
