using JuBEM

include("function_run.jl")

# mesh_file = "./input/meshes/homogbar_ne=1x10_l=10x1x1_eo=1.msh"
mesh_file = "./input/meshes/"

# problem_file = "./input/probs/bar_static.prob"
problem_file = "./input/probs/bar_static.prob"


output_file = "./results/h5/teste1.h5"

run_static(mesh_file, problem_file, output_file)

run_dynamic(mesh_file, problem_file, output_file)
