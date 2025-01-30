using JuBEM
using MAT

mat_file = "./results/MAT/teste.mat"
h5_file = "./results/h5/teste1.h5"

N,freqs = getflex_out(h5file)

file = matopen(matfile, "w")
write(file, "freqs", freqs)
write(file, "N_real", real.(N))
write(file, "N_imag", imag.(N))

close(file)