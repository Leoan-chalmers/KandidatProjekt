include("../Model/ODE_methods.jl")
include("../Model/parameter_values.jl")
include("../../Results/Parameter_values/Results_from_optimization.jl")

color_scheme = [Color_jalihal Color_alt_1 Color_alt_2]
labels = [label_jalihal label_alt_1 label_alt_2]

using Plots
default(dpi = 300)
default(titlefontsize=13)

function Generate_sol_array(shift_index, tspan)
    
    u0_SS_Jalihal = Steady_state_solver(p_conc_jalihal, first.(nutrient_shifts[shift_index]))
    sol_jalihal = ODE_solver(u0_SS_Jalihal, last.(nutrient_shifts[shift_index]), tspan, p_conc_jalihal)

    u0_SS_alt_1 = Steady_state_solver(p_conc_alt1, first.(nutrient_shifts[shift_index]))
    sol_alt1 = ODE_solver(u0_SS_alt_1, last.(nutrient_shifts[shift_index]), tspan, p_conc_alt1)

    u0_SS_alt_2 = Steady_state_solver(p_conc_alt2, first.(nutrient_shifts[shift_index]))
    sol_alt2 = ODE_solver(u0_SS_alt_2, last.(nutrient_shifts[shift_index]), tspan, p_conc_alt2)

    return [sol_jalihal, sol_alt1, sol_alt2]
end

function Generate_sol_array(shift_index, tspan, p_changes)
    
    p_conc_jalihal_copy = copy(p_conc_jalihal)
    p_conc_alt1_copy = copy(p_conc_alt1)
    p_conc_alt2_copy = copy(p_conc_alt2)

    # implement parameter changes
    for i in range(1, length(p_changes))
        p_conc_jalihal_copy[Get_index(p_conc_lookup_table, string(first.(p_changes)[i]))] = first.(p_changes)[i] => last.(p_changes)[i]
    end

    for i in range(1, length(p_changes))
        p_conc_alt1_copy[Get_index(p_conc_lookup_table, string(first.(p_changes)[i]))] = first.(p_changes)[i] => last.(p_changes)[i]
    end

    for i in range(1, length(p_changes))
        p_conc_alt2_copy[Get_index(p_conc_lookup_table, string(first.(p_changes)[i]))] = first.(p_changes)[i] => last.(p_changes)[i]
    end

    u0_SS_Jalihal = Steady_state_solver(p_conc_jalihal_copy, first.(nutrient_shifts[shift_index]))
    sol_jalihal = ODE_solver(u0_SS_Jalihal, last.(nutrient_shifts[shift_index]), tspan, p_conc_jalihal_copy)

    u0_SS_alt_1 = Steady_state_solver(p_conc_alt1_copy, first.(nutrient_shifts[shift_index]))
    sol_alt1 = ODE_solver(u0_SS_alt_1, last.(nutrient_shifts[shift_index]), tspan, p_conc_alt1_copy)

    u0_SS_alt_2 = Steady_state_solver(p_conc_alt2_copy, first.(nutrient_shifts[shift_index]))
    sol_alt2 = ODE_solver(u0_SS_alt_2, last.(nutrient_shifts[shift_index]), tspan, p_conc_alt2_copy)

    return [sol_jalihal, sol_alt1, sol_alt2]
end

function plot_simulation_result(show_plot::Bool, sol_array, output_variable::Num, y_lims, plot_title::String, file_name::String, legend_placement)

    for (index, sol) in enumerate(sol_array)
        if index == 1 # Create plot object
        global plot1 = plot(sol, vars = output_variable, title=plot_title, legend=legend_placement, label=labels[index], color=color_scheme[index], lw=2.0, show = false)
        else
            plot!(sol, vars = output_variable, label=labels[index], color=color_scheme[index], lw=1.5, show = false)
        end
    end
    ylims!(y_lims)
    xlabel!("t [min]")
    ylabel!(replace("$output_variable", "(t)" => ""))

    savefig(plot1, pwd()*"/Results/Model_analysis/pixel_images/"*file_name*".png")    
    savefig(plot1, pwd()*"/Results/Model_analysis/vector_images/"*file_name*".pdf")    

    if show_plot == true
        display(plot1)
    end
end
function plot_simulation_result(show_plot::Bool, sol_array, output_variable::Num, x_lims, y_lims, plot_title::String, file_name::String, legend_placement)

    for (index, sol) in enumerate(sol_array)
        if index == 1
        global plot1 = plot(sol, vars = output_variable, title=plot_title, legend=legend_placement, label=labels[index], color=color_scheme[index], lw=2.0, show = false)
        else
            plot!(sol, vars = output_variable, label=labels[index], color=color_scheme[index], lw=1.5, show = false)
        end
    end

    ylims!(y_lims)
    xlims!(x_lims)
    xlabel!("t [min]")
    ylabel!(replace("$output_variable", "(t)" => ""))

    savefig(plot1, pwd()*"/Results/Model_analysis/pixel_images/"*file_name*".png")    
    savefig(plot1, pwd()*"/Results/Model_analysis/vector_images/"*file_name*".pdf") 

    if show_plot == true
        display(plot1)
    end
end

function plot_wt_mut_results(show_plot::Bool, sol_array_wt, sol_array_mut, output_variable::Num, x_lims, y_lims, plot_title::String, file_name::String, legend_placement)
    
    sol_arrays = [sol_array_wt, sol_array_mut]

    for (index_array, sol_array) in enumerate(sol_arrays) 
        for (index, sol) in enumerate(sol_array)
            if index_array == 1     # plot the mutans
                if index == 1
                global plot1 = plot(sol, vars = output_variable, title=plot_title, legend=legend_placement, label=labels[index], color=color_scheme[index], lw=2.0, show = false)
                else
                    plot!(sol, vars = output_variable, label=labels[index], color=color_scheme[index], lw=1.5, show = false)
                end
            else    # plot the mutants
                plot!(sol, vars = output_variable, label="", color=color_scheme[index], linestyle=:dash, lw=1.5, show = false)
            end
        end
    end

    # Adds invisible lines for extra plot entries
    plot!([1], [0], label = "wt", color="black")
    plot!([1], [0], linestyle=:dash, label="mutant", color="black")

    ylims!(y_lims)
    xlims!(x_lims)
    xlabel!("t [min]")
    ylabel!(replace("$output_variable", "(t)" => ""))

    savefig(plot1, pwd()*"/Results/Model_analysis/pixel_images/"*file_name*".png")    
    savefig(plot1, pwd()*"/Results/Model_analysis/vector_images/"*file_name*".pdf") 

    if show_plot == true
        display(plot1)
    end
end