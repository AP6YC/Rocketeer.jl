"""
    docstrings.jl

# Description
`DocStringExtensions` templates and common docstring constants.
"""

# -----------------------------------------------------------------------------
# DOCSTRING TEMPLATES
# -----------------------------------------------------------------------------

# Constants template
@template CONSTANTS =
"""
$(FUNCTIONNAME)

# Description
$(DOCSTRING)
"""

# Types template
@template TYPES =
"""
$(TYPEDEF)

# Summary
$(DOCSTRING)

# Fields
$(TYPEDFIELDS)
"""

# Template for functions, macros, and methods (i.e., constructors)
@template (FUNCTIONS, METHODS, MACROS) =
"""
$(TYPEDSIGNATURES)

# Summary
$(DOCSTRING)

# Method List / Definition Locations
$(METHODLIST)
"""
