using JuBEM

h5_file = "./results/h5/teste1.h5"
vtk_file = "./results/vtk/teste"

mesh, material, problem, solver_var = readvars_out(h5_file)

freqs = getfreqs_out(h5_file)

u, t = getfreqres_out(h5_file, freqs[1])

writevtk(mesh,Solution(u,t), vtk_file)