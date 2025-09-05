# setup my paths -
const _PATH_TO_ROOT = @__DIR__;
const _PATH_TO_SRC = joinpath(_PATH_TO_ROOT, "src");
const _PATH_TO_DATA = joinpath(_PATH_TO_ROOT, "data");


# make sure all is up to date -
using Pkg
if (isfile(joinpath(_PATH_TO_ROOT, "Manifest.toml")) == false) # have manifest file, we are good. Otherwise, we need to instantiate the environment
    Pkg.add(path="https://github.com/varnerlab/VLQuantitativeFinancePackage.jl.git")
    Pkg.activate("."); Pkg.resolve(); Pkg.instantiate(); Pkg.update();
end

# load external packages -
using VLQuantitativeFinancePackage
using DataFrames
using CSV
using Dates
using LinearAlgebra
using Statistics
using StatsBase
using Plots
using Colors
using StatsPlots
using JLD2
using FileIO
using Distributions
using PrettyTables

# load my files -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"));
include(joinpath(_PATH_TO_SRC, "Trees.jl"));