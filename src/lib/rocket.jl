"""
    rocket.jl

# Description
Main file implementing the types and function for the Rocket method.
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
"""

# -----------------------------------------------------------------------------
# STRUCTURES
# -----------------------------------------------------------------------------

"""
Structure containing information about one Rocket kernel.

$(DOCSTRING_ATTRIBUTION)
"""
struct RocketKernel
    """
    The length of the kernel.
    """
    length::Int

    """
    The vector of weights corresponding to the features.
    """
    weight::Vector{Float}

    """
    The internal Rocket bias parameter, computed during construction.
    """
    bias::Float

    """
    The internal Rocket dilation parameter, computed during construction.
    """
    dilation::Int

    """
    The internal Rocket padding parameter, computed during construction.
    """
    padding::Int
end

"""
Structure containing a vector of [`RocketKernel`](@ref).

$(DOCSTRING_ATTRIBUTION)
"""
struct RocketModule
    """
    The input length used to generate the [`RocketKernel`](@ref)s.
    """
    input_length::Int

    """
    The list of [`RocketKernel`](@ref)s constituting a full Rocket module.
    """
    kernels::Vector{RocketKernel}
end

# -----------------------------------------------------------------------------
# CONSTRUCTORS
# -----------------------------------------------------------------------------

"""
Create a new RocketModule structure, requiring feature length and the number of kernels.

# Arguments
- `input_length::Integer`: the desired length of the kernel features.
- `n_kernels::Integer`: the desired number of kernels to generate.

$(DOCSTRING_ATTRIBUTION)
"""
function RocketModule(input_length::Integer, n_kernels::Integer)
    # Declare our candidate kernel lengths
    candidate_lengths = [7, 9, 11]

    # Instantiate the list of kernels
    kernels = Vector{RocketKernel}()

    # Iteratively create the kernels
    for _ = 1:n_kernels
        # Compute kernel parameters
        _length = sample(candidate_lengths)
        _weight = randn(_length)
        _bias = rand() * 2 - 1
        _dilation = Integer(floor(rand() * log2((input_length - 1) / (_length - 1))))
        _padding = Bool(rand(0:1)) ? Integer(floor(((_length - 1) * _dilation) / 2)) : 0
        # Create the kernel
        _kernel = RocketKernel(
            _length,
            _weight,
            _bias,
            _dilation,
            _padding
        )
        push!(kernels, _kernel)
    end

    # Return the constructed Rocket module
    return RocketModule(
        input_length,
        kernels,
    )
end

"""
Empty constructor for a [`RocketModule`](@ref).

This uses the default values `input_length=5` and `n_kernels=100`.

$(DOCSTRING_ATTRIBUTION)
"""
function RocketModule()
    # Create a default RocketModule
    return RocketModule(
        ROCKET_DEFAULT_INPUT_LENGTH,
        ROCKET_DEFAULT_N_KERNELS,
    )
end

# -----------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------

"""
Apply a single [`RocketKernel`](@ref) to the sequence `x`.

# Arguments
- `kernel::RocketKernel`: the [`RocketKernel`](@ref) used for computing features.
- `x::RealVector`: data sequence for computing Rocket features.
"""
function apply_kernel(kernel::RocketKernel, x::RealVector)
    input_length = length(x)
    output_length = (input_length + (2 * kernel.padding)) - ((kernel.length - 1) * kernel.dilation)
    _ppv = 0
    _max = -Inf
    ending = (input_length + kernel.padding) - ((kernel.length - 1) * kernel.dilation)
    for i = -kernel.padding:ending
        _sum = kernel.bias
        index = i
        for j = 1:kernel.length
            if index > 0 && (index < input_length)
                _sum += kernel.weight[j] * x[index]
            end
            index += kernel.dilation
        end
        _max = max(_sum, _max)
        if _sum > 0
            _ppv += 1
        end
    end
    return [_ppv / output_length, _max]
end

"""
Run a vector of [`RocketKernel`](@ref)s along a sequence `x`.

# Arguments
- `rocket::RocketModule`: rocket module containing many kernels for processing.
- `x::RealVector`: data sequence for computing rocket features.
"""
function apply_kernels(rocket::RocketModule, x::RealVector)
    # Get the number of kernels for preallocation and iteration
    n_kernels = length(rocket.kernels)

    # Preallocate the return array
    features = zeros(n_kernels, 2)

    # Calculate the features for each kernel
    for i = 1:n_kernels
        features[i, :] = apply_kernel(rocket.kernels[i], x)
    end

    # Return the full features array
    return features
end

"""
Save the [`RocketModule`](@ref) parameters to a `.jld2` file.

# Arguments
`rocket::RocketModule`: the [`RocketModule`](@ref) to save.
`filepath::AbstractString`: default `rocket.jld2`, path to `.jld2` for saving rocket parameters.
"""
function save_rocket(rocket::RocketModule, filepath::AbstractString="rocket.jld2")
    # Use the JLD2 save_object for simplicity
    save_object(filepath, rocket)
end

"""
Load and return a [`RocketModule`](@ref) with existing parameters from a `.jld2` file.

# Arguments
`filepath::AbstractString`: default `rocket.jld2`, path to the `.jld2` containing rocket parameters.
"""
function load_rocket(filepath::AbstractString="rocket.jld2")
    # Use the JLD2 load_object for simplicity
    return load_object(filepath)
end

# -----------------------------------------------------------------------------
# BASE.SHOW OVERLOADS
# -----------------------------------------------------------------------------

"""
Overload of the show function for [`RocketKernel`](@ref).

# Arguments
- `io::IO`: the current IO stream.
- `kernel::RocketKernel`: the [`RocketKernel`](@ref) to print/display.
"""
function Base.show(io::IO, kernel::RocketKernel)
    print(io, "$(typeof(kernel))")
end

"""
Overload of the show function for [`RocketModule`](@ref).

# Arguments
- `io::IO`: the current IO stream.
- `rocket::RocketModule`: the [`RocketModule`](@ref) to print/display.
"""
function Base.show(io::IO, rocket::RocketModule)
    # print(io, "$(typeof(node))($(length(node.N)))")
    print(io, "$(typeof(rocket))(input_length=$(rocket.input_length), n_kernels=$(length(rocket.kernels)))")
end
