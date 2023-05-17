using TrixiTestBuildkite
using Documenter

DocMeta.setdocmeta!(TrixiTestBuildkite, :DocTestSetup, :(using TrixiTestBuildkite); recursive=true)

makedocs(;
    modules=[TrixiTestBuildkite],
    authors="Michael Schlottke-Lakemper <michael@sloede.com>",
    repo="https://github.com/sloede/TrixiTestBuildkite.jl/blob/{commit}{path}#{line}",
    sitename="TrixiTestBuildkite.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sloede.github.io/TrixiTestBuildkite.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sloede/TrixiTestBuildkite.jl",
    devbranch="main",
)
