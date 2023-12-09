# Run this from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
# Run this from repository root to serve:
#
#   julia -e 'using LiveServer; serve(dir="docs/build")'
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Documenter, DocStringExtensions, Luhot


makedocs(
    sitename="Luhot.jl",
    pages = [
            "Luhot.jl" => "index.md",  
            "API documentation" => "apis.md",
            "Internals: the Luhot IO system" => "io.md"

    ],
    )

deploydocs(
    repo = "github.com/neelsmith/Luhot.jl.git",
)
