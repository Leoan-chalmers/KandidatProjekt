# The file explains how the experimental data is normalized in order to create the  time course plots
include("exp_data.jl")
include("../Code/Model/ODE_methods.jl")

color_data = RGB(0.35, 0.4, 1) 

# For Mig1 there is no normalization done, due to the logarithmic scale in the data
data_Mig1_glucose_relief = raw_data_Mig1_glucose_relief

# data for cAMP uses min and max taken from all data for cAMP
data_sch9Delta_cAMP = Minmaxnorm(raw_data_sch9Delta_cAMP, 0.052, 1.227)
data_cAMP = Minmaxnorm(raw_data_cAMP, 0.052, 1.227)

# Snf1, sch9 uses the minmax function 
data_Snf1 = Minmaxnorm(raw_data_Snf1)

data_Sch9_glucose_relief = Minmaxnorm(raw_data_Sch9_glucose_relief)
data_Sch9_glucose_starve = Minmaxnorm(raw_data_Sch9_glucose_starve)

# data for Sch9 with unit %phosphorylation has min and max taken from all data for Sch9
data_Sch9_gtr1Delta = Minmaxnorm(raw_data_Sch9_gtr1Delta, 4.82, 52.27)
data_Sch9P_glutamine_L = Minmaxnorm(raw_data_Sch9P_glutamine_L, 4.82, 52.57)
data_Sch9P_glutamine_H = Minmaxnorm(raw_data_Sch9P_glutamine_H, 4.82, 52.57)

# Rib uses minmaxnorm function to normalize data 
data_Rib_rap = Minmaxnorm(raw_data_Rib_rap)
