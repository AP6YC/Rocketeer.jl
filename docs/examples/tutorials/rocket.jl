# ---
# title: Rocketeer Tutorial
# id: rocket-tutorial
# date: 2023-7-21
# cover: ../assets/julialang_logo_icon.png
# author: "[Sasha Petrenko](https://github.com/AP6YC)"
# julia: 1.9
# description: This demo provides a quick example of how to run the `Rocketeer.jl` package.
# ---

# ## Overview

# This demo shows how to get started with `Rocketeer.jl`.

# ## Setup

# First, we load the package in the usual manner with `using`

using Rocketeer

# Lets also declare a file name for saving the Rocket kernels along with some other script variables

## Save file name
filepath = "my_rocket"
## Rocket and data hyper parameters
input_length = 20
n_kernels = 200

# ## Create a `RocketModule`

# The hyperparameters of a `RocketModule` are the `input_length` of the features and the `n_kernels` number of kernels that we want to generate.
# To create a `RocketModule`, we have two constructors: one where we specify these two parameters, and one where we use the default values.
# Lets try out both:

## Create a default rocket module
my_rocket = RocketModule()

## Specify the hyperparameters
my_specific_rocket = RocketModule(input_length, n_kernels)

# We can save the Rocket kernels for later use:

## Save the module to the filepath
save_rocket(my_specific_rocket, filepath)

# and we can load them back up into a new object:

## Load the rocket module
my_new_rocket = load_rocket(filepath)

# We can see here that the we got back the same `RocketModule` as the one we created in `my_specific_rocket`.

# ## Extract Kernel Features

# Lets generate some random raw input data for applying the kernels to:

X = rand(input_length)

# and apply the kernels on that data to extract a set of features:

kernel_features = apply_kernels(my_new_rocket, X)

# And voila, it's as easy as that!
# We have some features to use for analysis or otherwise some good old time series classification with other machine learning models.

# Just to make sure to be thorough, we sill end this script by deleting the generated rocket save file.

## Delete the saved file
rm(filepath)
