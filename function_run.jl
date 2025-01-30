function run_dynamic(mesh_file,problem_file,output_file)

    mesh = read_msh(mesh_file)
    problem, materials = read_problem(problem_file,mesh)

    generate_mesh!(mesh)
    derive_data!(mesh,materials,problem)

    output_vars(output_file, mesh, problem, materials)

    assembly = statics_assembly(mesh,materials,problem)
    JuBEM.remove_EE!(mesh,assembly,problem)

    for freq in problem.frequencies
        println("Running for freq $freq")
        dynamics_assembly!(mesh,problem,materials,assembly,freq)

        # LHS, RHS = JuBEM.applyBC_multi_simple(mesh,problem,assembly.zH,assembly.zG)
        LHS, RHS = JuBEM.applyBC_rb_multi(mesh,problem,assembly.zH,assembly.zG)

        x = LHS\RHS

        # u,t = JuBEM.returnut_multi_simple(x,mesh,problem)
        # urb = []
        u,t, urb = JuBEM.returnut_rb_multi(x,mesh,problem)

        sol = Solution(u,t,urb,0.0,freq)
        output_solution(output_file,sol)


    end
    
end

function run_static(mesh_file,problem_file,output_file)

    mesh = read_msh(mesh_file)
    problem, materials = read_problem(problem_file,mesh)

    generate_mesh!(mesh)
    derive_data!(mesh,materials,problem)
    output_vars(output_file, mesh, problem, materials)

    assembly = JuBEM.statics_assembly(mesh,materials,problem)

    JuBEM.remove_EE!(mesh,assembly,problem)

    # LHS, RHS = applyBC_simple(mesh,problem,assembly.H,assembly.G)
    # LHS, RHS = applyBC_rb(mesh,problem,assembly.H,assembly.G)
    # LHS,RHS = JuBEM.applyBC_multi_simple(mesh,problem,assembly.H,assembly.G)
    LHS,RHS = JuBEM.applyBC_rb_multi(mesh,problem,assembly.H,assembly.G)

    x = LHS\RHS

    # u,t = JuBEM.returnut_simple(x,mesh,problem)
    # u,t = JuBEM.returnut_multi_simple(x,mesh,problem)
    # urb = []
    # u,t,urb = JuBEM.returnut_rb(x,mesh,problem)
    u,t,urb = JuBEM.returnut_rb_multi(x,mesh,problem)

    sol = Solution(u,t,urb,0.0,0.0)

    output_solution(output_file,sol)

end
