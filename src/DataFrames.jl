# Note that the two calls to using Stats in this file are
# strictly required: one pulls the names into DataFrames
# for easy access within the module, whereas the other call
# pushes those names into Main.
using StatsBase
using DataArrays

module DataFrames

##############################################################################
##
## Dependencies
##
##############################################################################

using Base.Intrinsics
using DataArrays
using GZip
using StatsBase
using SortingAlgorithms

##############################################################################
##
## Global constants
##
##############################################################################

const DEFAULT_COLUMN_TYPE = Float64

##############################################################################
##
## Extend methods in Base by default
##
##############################################################################

importall Base
importall StatsBase
import Base: Sort, Order
import Base.Sort: sort, sort!, Algorithm, defalg, issorted
import Base.Order: Ordering, By, Lt, Perm, Forward, lt, ord
import Base.AsyncStream

##############################################################################
##
## Exported methods and types
##
##############################################################################

export @~,
       AbstractDataFrame,
       array,
       by,
       cbind,
       coefnames,
       colwise,
       combine,
       complete_cases,
       complete_cases!,
       cut,
       DataFrame,
       DataFrameRow,
       describe,
       drop_duplicates!,
       duplicated,
       eachcol,
       eachrow,
       findat,
       flipud!,
       flipud,
       Formula,
       gl,
       GroupApplied,
       groupby,
       GroupedDataFrame,
       interaction_design_matrix,
       load_df,
       matrix,
       merge,
       model_response,
       ModelFrame,
       ModelMatrix,
       names!,
       ncol,
       nrow,
       order,
       pool,
       pool!,
       printtable,
       range,
       rbind,
       readtable,
       rep,
       rename!,
       rename,
       save,
       stack,
       SubDataFrame,
       subset,
       types,
       unique,
       unstack,
       vector,
       writetable,
       xtab,
       xtabs,
       stack_df,
       melt,
       melt_df,
       pivot_table,
       RComplex,     # Vector{Complex128}
       RInteger,     # Vector{Int32} plus BitVector of NA indicators
       RLogical,     # BitVector of values and BitVector of NA indicators
       RNumeric,     # Vector{Float64}
       RList,        # Vector{Any}
       RString,      # Vector{ASCIIString}
       RSymbol,      # Symbol stored as an String b/c of embedded '.'

       class,                              # in the S3 sense of "class"
       inherits,
       read_rda,
       vecbind

##############################################################################
##
## Load files
##
##############################################################################

include("utils.jl")
include("index.jl")
include("abstractdataframe.jl")
include("dataframe.jl")
include("sort.jl")
include("iteration.jl")
include("show.jl")
include("merge.jl")
include("grouping.jl")
include("reshape.jl")
include("formula.jl")
include("io.jl")
include("extras.jl")
include("RDA.jl")

##############################################################################
##
## Deprecations
##
##############################################################################

Base.@deprecate vecbind vcat
Base.@deprecate rbind vcat
Base.@deprecate cbind hcat
Base.@deprecate read_table readtable
Base.@deprecate print_table printtable
Base.@deprecate write_table writetable
Base.@deprecate merge(df1::AbstractDataFrame, df2::AbstractDataFrame; on::Any = nothing, kind::Symbol = :inner) Base.join
Base.@deprecate colnames(adf::AbstractDataFrame) Base.names
Base.@deprecate colnames!(adf::AbstractDataFrame, vals) names!
Base.@deprecate coltypes(adf::AbstractDataFrame) types
Base.@deprecate EachRow eachrow
Base.@deprecate EachCol eachcol
Base.@deprecate subset sub

end # module DataFrames
