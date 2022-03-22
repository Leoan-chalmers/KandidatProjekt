# 

using DifferentialEquations
using ModelingToolkit
using Plots

include("ODE_functions.jl") 

include("parameter_values.jl")
# Pre-shift => No change in parameter values

include("ODE_methods.jl")
u0_SS = Steady_state_solver(p_const, p_var, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0)) # Returnerar steady state för parametrarna p

# Post-shift: Rapamycin treatment => TORC1_T = 0.0 
p_const[Get_index(p_const_lookup_table, "TORC1_T")] = TORC1_T => 0.0

# Steady-state vid svältning utgör initialvärden för Glutamine addition
tspan = (0.0, 90.0) # [min]
sol = ODE_solver(u0_SS, (Carbon => 1.0, ATP => 1.0, Glutamine_ext => 1.0), tspan, p_const, p_var)

# Rel. RPL32 mRNA motsvarar (Rib/steady-state värde för Rib)
include("exp_data.jl")

data = Minmaxnorm(data_Rib_rap)
plot1 = scatter(t_Rib_rap, data)

plot!(sol, vars=Rib/(1e-3+u0_SS[25]), legend=false) # 1e-2 ensures denom != 0
xlabel!("t [min]")
ylabel!("Rel. RPL32 mRNA") # Motsvarar konc. Rib relativt steady state
title!("Rapamycin treatment, TORC1_T = 0")
display(plot1)