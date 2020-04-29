"""
   ApproximateBayesianComputing
Module providing
   types (abc_pmc_plan_type, abc_population_type) and methods (generate_theta, init_abc, update_abc_pop, run_abc) for using Approximate Bayesian Computing
"""
module ApproximateBayesianComputing
const ABC = ApproximateBayesianComputing

# package code goes here

using Distributions
using PDMats
using DistributedArrays
using Compat
if VERSION >= v"0.7"
  using Statistics
  using Distributed
  import Base: length
  import Statistics: mean, median, maximum, minimum, quantile, std, var, cov, cor
  import LinearAlgebra.isposdef
else
  #import Base: sum, mean, std
  import Compat: sum, mean, std
  import Base: length, median, maximum, minimum, quantile, var, cov, cor
  using Compat.Statistics
  using Compat.Distributed
end

export
  # types
  abc_plan_type,
  abc_pmc_plan_type,
  abc_population_type,

  # util methods

  # abc alg methods
  generate_theta,
  init_abc,
  update_abc_pop,
  run_abc


import StatsBase.sample
import Base: rand
import Compat: @compat

# until added to distributions, use our own
include("GaussianMixtureModelCommonCovar.jl")

include("types.jl")
include("util.jl")
include("alg.jl")
include("alg_serial.jl")
include("alg_parallel.jl")
#include("alg_parallel_custom.jl")
include("make_proposal.jl")
include("log.jl")
#include("emulator.jl")


# Bonus code!
include("composite.jl")
export CompositeDistributions
include("beta_linear_transformed.jl")
export TransformedBetaDistributions

end # module
