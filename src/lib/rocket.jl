"""
    rocket.jl

# Description
Main file implementing the types and function for the Rocket method.
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
Structure containing a vector of [`RocketKernel`](@ref)s.

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

        # Construct the kernel
        _kernel = RocketKernel(
            _length,
            _weight,
            _bias,
            _dilation,
            _padding
        )

        # Add the local kernel to the list of kernels
        push!(kernels, _kernel)
    end

    # Return the constructed Rocket module from the
    return RocketModule(
        input_length,
        kernels,
    )
end

"""
Empty constructor for a [`RocketModule`](@ref).

This uses the default values `input_length=$(ROCKET_DEFAULT_INPUT_LENGTH)` and `n_kernels=$(ROCKET_DEFAULT_N_KERNELS)`.

$(DOCSTRING_ATTRIBUTION)
"""
function RocketModule()
    # Create a default RocketModule
    return RocketModule(
        ROCKET_DEFAULT_INPUT_LENGTH,    # input_length
        ROCKET_DEFAULT_N_KERNELS,       # n_kernels
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
    # Initialize output Rocket features
    _ppv = 0
    _max = -Inf

    # Get the sliding window range for computing features
    input_length = length(x)
    output_length = (input_length + (2 * kernel.padding)) - ((kernel.length - 1) * kernel.dilation)
    ending = (input_length + kernel.padding) - ((kernel.length - 1) * kernel.dilation)

    # Iterate across the sliding window indices
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

    # Return the Rocket features as a concatenated vector
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
- `rocket::RocketModule`: the [`RocketModule`](@ref) to save.
- `filepath::AbstractString`: default `rocket.jld2`, path to `.jld2` for saving rocket parameters.
"""
function save_rocket(rocket::RocketModule, filepath::AbstractString="rocket.jld2")
    # Use the JLD2 save_object for simplicity
    save_object(filepath, rocket)

    # Explicit empty return
    return
end

"""
Load and return a [`RocketModule`](@ref) with existing parameters from a `.jld2` file.

# Arguments
- `filepath::AbstractString`: default `rocket.jld2`, path to the `.jld2` containing rocket parameters.
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
    # Display basic parameters of the single Rocket kernel
    print(io, "$(typeof(kernel))(length=$(kernel.length))")

    # Explicit empty return
    return
end

"""
Overload of the show function for [`RocketModule`](@ref).

# Arguments
- `io::IO`: the current IO stream.
- `rocket::RocketModule`: the [`RocketModule`](@ref) to print/display.
"""
function Base.show(io::IO, rocket::RocketModule)
    # Display basic parameters of the entire Rocket module
    print(io, "$(typeof(rocket))(input_length=$(rocket.input_length), n_kernels=$(length(rocket.kernels)))")

    # Explicit empty return
    return
end
