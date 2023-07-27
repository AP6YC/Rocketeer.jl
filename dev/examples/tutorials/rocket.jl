using Rocketeer

# Save file name
filepath = "my_rocket"
# Rocket and data hyper parameters
input_length = 20
n_kernels = 200

# Create a default rocket module
my_rocket = RocketModule()

# Specify the hyperparameters
my_specific_rocket = RocketModule(input_length, n_kernels)

# Save the module to the filepath
save_rocket(my_specific_rocket, filepath)

# Load the rocket module
my_new_rocket = load_rocket(filepath)

X = rand(input_length)

kernel_features = apply_kernels(my_new_rocket, X)

# Delete the saved file
rm(filepath)

# This file was generated using Literate.jl, https://github.com/fredrikekre/Literate.jl

