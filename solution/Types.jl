abstract type AbstractTreeModel end


"""
    mutable struct MyGeneralDiscreteRecombiningTreeModel <: AbstractPriceTreeModel

The `MyGeneralDiscreteRecombiningTreeModel` type is a model of a commodity price tree that uses an dictionary to store the price data.
This model stores the connectivity information between nodes.

### Fields
- `data::Union{Nothing, Dict{Int64,NamedTuple}}` - A dictionary that stores the price data and path informationfor the tree.
- `connectivity::Dict{Int64,Array{Int64,1}}` - A dictionary that stores the connectivity information between nodes.
"""
mutable struct MyGeneralDiscreteRecombiningTreeModel <: AbstractTreeModel

    # data -
    data::Union{Nothing, Dict{Int64,NamedTuple}}
    connectivity::Dict{Int64,Array{Int64,1}}
    h::Int64 # height of the tree
    n::Int64 # branching factor

    # constructor 
    MyGeneralDiscreteRecombiningTreeModel() = new()
end
