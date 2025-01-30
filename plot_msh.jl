using JuBEM

mesh_file = "./input/meshes/homogbar_ne=1x10_l=10x1x1_eo=1.msh"

mesh = read_msh(mesh_file)

plt = plot_meshtags(mesh)

display(plt)