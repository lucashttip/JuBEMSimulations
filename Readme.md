# JuBEMSimulations

JuBEMSimulations is a repository that serves as an example to a simulation workflow using JuBEM.jl and [JuBEMeshes.jl](https://github.com/lucashttip/JuBEMeshes.jl).

# Installation

In order to make simulations using JuBEM there are a few programs that are necessary and others that are optional and supplementary. The programs are the following:

1. Julia (Mandatory)
   1. JuBEMeshes.jl package (Mandatory)
   2. JuBEM.jl package (Mandatory)
   3. MAT (Optional)
2. VSCode (Optional)
   1. Julia Extension (Optional)
3. Paraview (Optional)
4. HDFview (Optional)

## Julia installation

Install julia from its official website [julialang.org](https://julialang.org/).

Once you install julia, add the JuBEMeshes.jl package by going to your julia REPL and running:

```julia
] dev https://github.com/lucashttip/JuBEMeshes.jl
```

Now you need to install JuBEM.jl. JuBEM.jl is a private package, so in order to install it, you need to download the source code. You shoul ask for a download link from its original author [Lucas Pacheco](l235212@dac.unicamp.br). Download the source code and put it in a known folder in your computer. Then in order to install it, run:

```julia
] dev <path/to/JuBEM.jl>
```

To install the MAT package:

```julia
] add MAT
```

