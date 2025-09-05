"""
    function build(type::Type{MyGeneralDiscreteRecombiningTreeModel}, data::NamedTuple) -> MyGeneralDiscreteRecombiningTreeModel

Builds an `MyGeneralDiscreteRecombiningTreeModel` model given the data in the `NamedTuple`. 
This method builds the connectivity of the tree. To compute the quantity at each node, use the `populate!` method.

### Arguments
- `type::Type{MyGeneralDiscreteRecombiningTreeModel}`: The type of the model to build.
- `data::NamedTuple`: The data to use to build the model.

The `data` `NamedTuple` must contain the following fields:
- `h::Int64`: The height of the tree.
- `quantity::Float64`: The quantity at the root node.
- `u::Float64`: The quantity increase factor.
- `d::Float64`: The quantity decrease factor.

### Returns
- `MyGeneralRecombiningTreeModel`: the quantity tree model holding the computed quantity data.
"""
function build(modeltype::Type{MyGeneralDiscreteRecombiningTreeModel}, 
    data::NamedTuple)::MyGeneralDiscreteRecombiningTreeModel

    # get data -
    n = data.n; # branching factor
    h = data.h; # height of the tree
    model = modeltype(); # create an empty model
    
    # initialize -
    connectivity = Dict{Int64, Array{Int64,1}}();
    levels = Dict{Int64, Array{Int64,1}}();
    Nₕ = binomial(h + n, h) # number of nodes in the tree

    # compute the connectivity -
    for i ∈ 0:(Nₕ - 1)
        connectivity[i] = children_indices(i, n; base=0)
    end

    # compute the nodes at each level of the tree -
    focusnode = 0;
    for i ∈ 0:h
        levels[i] = Array{Int64,1}();
    end

    for l ∈ 0:h
        number_of_nodes_at_this_level = nodes_at_level(l, n);
        for _ ∈ 1:number_of_nodes_at_this_level
            push!(levels[l], focusnode);
            focusnode += 1;
        end
    end
    
    # set the data, and connectivity for the model -
    model.data = nothing; # we don't have any data yet, set as nothing
    model.levels = levels;
    model.connectivity = connectivity;
    model.h = h; # height of the tree
    model.n = n; # branching factor

    # return -
    return model;
end