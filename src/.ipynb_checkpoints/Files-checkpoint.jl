
# -- PRIVATE METHODS BELOW HERE ----------------------------------------------------------------------------------------------- #
function _loadcsvfile(path::String)::DataFrame
    return CSV.read(path, DataFrame);
end

function _jld2(path::String)::Dict{String,Any}
    return load(path);
end
# -- PRIVATE METHODS ABOVE HERE ----------------------------------------------------------------------------------------------- #


# -- PUBLIC METHODS BELOW HERE ------------------------------------------------------------------------------------------------ #
"""
    function MyTreasuryBillsNotesAndBondsDataSet() -> DataFrame

The `MyTreasuryBillsNotesAndBondsDataSet` function loads the US Treasury Bills, Notes, and Bonds dataset from the data directory. 
This function takes no arguments and returns a `DataFrame` object holding the dataset.
"""
function MyTreasuryBillsNotesAndBondsDataSet()::DataFrame
    return _loadcsvfile(joinpath(_PATH_TO_DATA, "US-TreasuryDataset-TD-09-07-2024.csv"));
end
# -- PUBLIC METHODS ABOVE HERE ------------------------------------------------------------------------------------------------ #