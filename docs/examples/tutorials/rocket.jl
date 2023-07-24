# ---
# title: Rocket Tutorial
# id: rocket-tutorial
# date: 2023-7-21
# cover: ../assets/julialang_logo_icon.png
# author: "[Sasha Petrenko](https://github.com/AP6YC)"
# julia: 1.9
# description: This demo provides a quick example of how to run the `Rocket.jl` package.
# ---

# ## Overview

# This demo shows how to get started with `Rocket.jl`.

# ## Setup

# First, we load the package in the usual manner with `using`

using Rocket

# Lets also declare a file name for saving the Rocket kernels

## Save file name
filepath = "my_rocket"

# ## Create a `RocketModule`

# The hyperparameters of a `RocketModule` are the `input_length` of the features and the `n_kernels` number of kernels that we want to generate.
# To create a `RocketModule`, we have two constructors: one where we specify these two parameters, and one where we use the default values.
# Lets try out both:

## Create a default rocket module
my_rocket = RocketModule()

## Specify the hyperparameters
my_specific_rocket = RocketModule(10, 200)

# Save the module to the filepath
Rocket.save_rocket(my_rocket, filepath)

# Load the rocket module
my_new_rocket = Rocket.load_rocket(filepath)

# Delete the saved file
rm(filepath)

# !!! note
#     This example is in development.
