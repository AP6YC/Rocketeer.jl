"""
    lib.jl

# Description
Aggregates all types and functions that are used throughout the `OAR` project.

# Authors
- Sasha Petrenko <petrenkos@mst.edu>
"""

# -----------------------------------------------------------------------------
# INCLUDES
# -----------------------------------------------------------------------------

# Project version constant
include("version.jl")

# Constants used in the package
include("constants.jl")

# DocStringExtensions templates, etc.
include("docstrings.jl")

# Definition of the Rocket method
include("rocket.jl")
