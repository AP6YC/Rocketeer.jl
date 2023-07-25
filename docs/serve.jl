"""
    serve.jl

# Description
Convenience script that serves the locally built documentation.

# Authors
- Sasha Petrenko <petrenkos@mst.edu>
"""

# -----------------------------------------------------------------------------
# DEPENDENCIES
# -----------------------------------------------------------------------------

using Revise
using LiveServer

# -----------------------------------------------------------------------------
# INCLUDES
# -----------------------------------------------------------------------------

# Make the documentation
include("make.jl")
# -----------------------------------------------------------------------------
# SERVE
# -----------------------------------------------------------------------------

# Serve the documentation for development
serve(dir="build")
