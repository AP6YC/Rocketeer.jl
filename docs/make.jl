using Documenter
using Rocket

makedocs(
    sitename = "Rocket",
    format = Documenter.HTML(),
    modules = [Rocket]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
