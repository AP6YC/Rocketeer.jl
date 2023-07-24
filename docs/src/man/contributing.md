# Contributing

This page serves as the contribution guide for the `Rocket.jl` package.
From top to bottom, the ways of contributing are:

- [GitHub Issues:](@ref Issues) how to raise an issue with the project.
- [Julia Development:](@ref Julia-Development) how to download and interact with the package.
- [GitFlow:](@ref GitFlow) how to directly contribute code to the package in an organized way on GitHub.
- [Development Details:](@ref Development-Details) how the internals of the package are currently setup if you would like to directly contribute code.

Please also see the [Attribution](@ref attribution) to learn about the authors and sources of support for the project.

## Issues

The main point of contact is the [GitHub issues](https://github.com/AP6YC/Rocket/issues) page for the project.
This is the easiest way to contribute to the project, as any issue you find or request you have will be addressed there by the authors of the package.
Depending on the issue, the authors will collaborate with you, and after making changes they will link a [pull request](@ref GitFlow) which addresses your concern or implements your proposed changes.

## Julia Development

As a Julia package, development follows the usual procedure:

1. Clone the project from GitHub
2. Switch to or create the branch that you wish work on (see [GitFlow](@ref)).
3. Start Julia at your development folder.
4. Instantiate the package (i.e., download and install the package dependencies).

For example, you can get the package and startup Julia with

```sh
git clone git@github.com:AP6YC/Rocket.jl.git
julia --project=.
```

!!! note "Note"
    In Julia, you must activate your project in the current REPL to point to the location/scope of installed packages.
    The above immediately activates the project when starting up Julia, but you may also separately startup the julia and activate the package with the interactive
    package manager via the `]` syntax:

    ```julia-repl
    julia
    julia> ]
    (@v1.9) pkg> activate .
    (Rocket) pkg>
    ```

You may run the package's unit tests after the above setup in Julia with

```julia-repl
julia> using Pkg
julia> Pkg.instantiate()
julia> Pkg.test()
```

or interactively though the Julia package manager with

```julia-repl
julia> ]
(Rocket) pkg> instantiate
(Rocket) pkg> test
```

## GitFlow

The `Rocket.jl` package follows the [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/) git working model.
The [original post](https://nvie.com/posts/a-successful-git-branching-model/) by Vincent Driessen outlines this methodology quite well, while [Atlassian](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) has a good tutorial as well.
In summary:

1. Create a feature branch off of the `develop` branch with the name `feature/<my-feature-name>`.
2. Commit your changes and push to this feature branch.
3. When you are satisfied with your changes, initiate a [GitHub pull request](https://github.com/AP6YC/Rocket.jl/pulls) (PR) to merge the feature branch with `develop`.
4. If the unit tests pass, the feature branch will first be merged with develop and then be deleted.
5. Releases will be periodically initiated from the `develop` branch and versioned onto the `master` branch.
6. Immediate bug fixes circumvent this process through a `hotfix` branch off of `master`.

## Development Details

### Documentation

These docs are currently hosted as a static site on the GitHub pages platform.
They are setup to be built and served in a separate branch called `gh-pages` from the master/development branches of the project.

### Package Structure

The `Rocket.jl` project has the following file structure:

```console
Rocket.jl
├── .github/workflows       // GitHub: workflows for testing and documentation.
├── docs                    // Docs: documentation for the module.
│   └───src                 //      Documentation source files.
├── src                     // Source: library source code.
├── test                    // Test: Unit, integration, and environment tests.
├── .gitattributes          // Git: LFS settings, languages, etc.
├── .gitignore              // Git: .gitignore for the whole project.
├── CODE_OF_CONDUCT.md      // Doc: the code of conduct for contributors.
├── CONTRIBUTING.md         // Doc: contributing guide (points to this page).
├── LICENSE                 // Doc: the license to the project.
├── Project.toml            // Julia: the Pkg.jl dependencies of the project.
└── README.md               // Doc: the top-level readme for the project.
```
