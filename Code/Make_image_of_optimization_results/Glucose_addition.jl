# 

using DifferentialEquations
using ModelingToolkit
using Plots
function Glucose_addition_cAMP()
    include("../Model/ODE_functions.jl") 

    include("../Model/parameter_values.jl")

    include("../Model/ODE_methods.jl")
    include("../../Data/exp_data_norm.jl")
    include("../../Results/Parameter_values/Results_from_optimization.jl")
    include("../../Data/exp_data_norm.jl")
    u0_SS = Steady_state_solver(p_const, p_var_alt_1, 
    (Carbon => 0.0, ATP => 0.0, Glutamine_ext => 1.0)) # Returnerar steady 
    # state för parametrarna p

    # Post-shift, Glucose addition => ATP, Carbon = 1
    tspan_cAMP = (0.0, 3.0) # [min]
    sol = ODE_solver(u0_SS, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0),
    tspan_cAMP, p_const, p_var_alt_1)

    plot1 = scatter(t_cAMP, data_cAMP, markersize = 5.5, color = color_data, 
    markerstrokewidth=0.8, labels= "Data")

    plot!(plot1, sol, vars = cAMP, color = Color_alt_1, lw=2.5, 
    labels= label_alt_1)

    u0_SS = Steady_state_solver(p_const, p_var_alt_2, 
    (Carbon => 0.0, ATP => 0.0, Glutamine_ext => 1.0)) # Returnerar steady 
    # state för parametrarna p

    # Post-shift, Glucose addition => ATP, Carbon = 1
    tspan_cAMP = (0.0, 3.0) # [min]
    sol = ODE_solver(u0_SS, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0),
    tspan_cAMP, p_const, p_var_alt_2)

    plot!(plot1, sol, vars=cAMP, color = Color_alt_2, lw=2.5, 
    labels= label_alt_2)

    u0_SS = Steady_state_solver(p_const, p_var_jalihal, 
    (Carbon => 0.0, ATP => 0.0, Glutamine_ext => 1.0)) # Returnerar steady 
    # state för parametrarna p

    # Post-shift, Glucose addition => ATP, Carbon = 1
    tspan_cAMP = (0.0, 3.0) # [min]
    sol = ODE_solver(u0_SS, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0),
    tspan_cAMP, p_const, p_var_jalihal)

    plot!(plot1, sol, vars=cAMP, color = Color_jalihal, lw=2.5, 
    labels= label_jalihal)

    xlabel!("t [min]")
    ylabel!("cAMP")
    ylims!((0.0, 1.02))
    xlims!((-0.02, last(tspan_cAMP)*1.02))
    title!("Glukostillsättning cAMP")
    return plot1
end

function Glucose_addition_Sch9()
    include("../Model/ODE_functions.jl") 

    include("../Model/parameter_values.jl")

    include("../Model/ODE_methods.jl")
    include("../../Data/exp_data_norm.jl")
    include("../../Results/Parameter_values/Results_from_optimization.jl")
    
    u0_SS = Steady_state_solver(p_const, p_var_alt_1, 
    (Carbon => 0.0, ATP => 0.0, Glutamine_ext => 1.0))
    tspan_Sch9 = (0.0, 30.0) # [min]
    sol = ODE_solver(u0_SS, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0),
    tspan_Sch9, p_const, p_var_alt_1)

    plot2 = scatter(t_Sch9_glucose_relief, data_Sch9_glucose_relief, 
    markersize = 5.5, color = color_data, markerstrokewidth=0.8, 
    label = "Data")

    plot!(plot2, sol, vars = Sch9, color = Color_alt_1, lw=2.5, 
    labels= label_alt_1)


    u0_SS = Steady_state_solver(p_const, p_var_alt_2, 
    (Carbon => 0.0, ATP => 0.0, Glutamine_ext => 1.0))
    tspan_Sch9 = (0.0, 30.0) # [min]
    sol = ODE_solver(u0_SS, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0),
    tspan_Sch9, p_const, p_var_alt_2)

    plot!(plot2, sol, vars=Sch9, color = Color_alt_2, lw=2.5, 
    labels= label_alt_2)


    u0_SS = Steady_state_solver(p_const, p_var_jalihal, 
    (Carbon => 0.0, ATP => 0.0, Glutamine_ext => 1.0))
    tspan_Sch9 = (0.0, 30.0) # [min]
    sol = ODE_solver(u0_SS, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0),
    tspan_Sch9, p_const, p_var_jalihal)

    plot!(plot2, sol, vars=Sch9, color = Color_jalihal, lw=2.5, 
    labels= label_jalihal)

    xlabel!("t [min]")
    ylabel!("Sch9")
    ylims!((0.0, 1.02))
    xlims!((-0.3, last(tspan_Sch9)*1.02))
    title!("Glukostillsättning Sch9 p")
    return plot2
end
