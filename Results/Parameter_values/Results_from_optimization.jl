include("../../Code/Model/ODE_functions.jl")
include("../../Code/Model/parameter_values.jl")

using Plots

#Alt 1
Color_alt_1 = RGB(249/255,212/255,35/255)
label_alt_1 = "Parametervektor 1"

p_var_alt_1 = [gammacyr => 18.322882081228986, w_cyr_glu => 3.6633999531005634, w_cyr_snf => 0.1285302238461551, 
w_cyr => 0.6059280389339637, w_dot => 0.29859496480262826, w_dot_sch_pka => 0.26984973500579434, 
w_ego => 0.14425669637415833, w_ego_basal => 0.006814200479995382, gammaego => 14.736736141864862, 
w_ego_gap => 3.084279203114428, gammagap => 0.6663448945308855, w_gap_torc => 65.85992935027903, 
w_gap_N => 34.2766745380838, gamma_gcn2 => 3.4453269070855477, w_gcn_torc => 3.306379713332646, 
w_gcn => 0.23454636628836736, w_gcn4_gcn2_trna => 0.4912494787320278, w_gcn4 => 1.0432305907464907, 
tRNA_sensitivity => 114.66813114510322, tRNA_total => 1.2406350409199844, w_gis => 2.050475783412456, 
w_gis_pka => 7.217918860351613, w_gis_sch => 0.4425895833082018, w_gln1_gln3 => 1.395808403337666, 
w_gln1 => 0.4670875108930438, gammagln1 => 0.06914367796507906, w_gln_snf => 1.5788171694107367, 
w_gln_sit => 0.2404956660111842, w_gln3 => 1.603042453826415, gammagln3 => 0.040164304185710965, 
k_acc_pro => 0.0013118240019047525, k_acc_glu => 0.05229669457960585, k_degr => 0.09599631569415247, 
k_acc_nh4 => 0.0024859229170995766, w_mig_snf => 0.8162274919437411, w_mig => 7.815869018524566, 
gamma_mig => 1.164435581740471, w_mig_pka => 6.336797432203219, gammapde => 0.20574815477230357, 
w_pde_pka => 3.9405784158373662, w_pde => 0.9996420795693384, w_pka => 0.13971421470413295, 
w_pka_sch9 => 41.48203870342469, w_pka_camp => 132.76026480145333, gammapka => 1.5340964099477878, 
k_pr => 0.08020678151736915, w_ras_pka => 2.7963243302203162, gammaras => 1.1147866300004579, 
w_ras_glu => 0.5929948563300336, w_ras => 0.012974111183497556, k_mRNA_degr => 0.07544679796135792, 
k_transcription => 0.15269009808367842, w_rtg => 0.06984179043085359, w_rtg_torc => 0.6110744127682198, 
w_sak => 0.21523434075177722, w_sak_pka => 0.8123596239993751, w_sch9_torc => 1.7534961165216625, 
w_sch9 => 1.4098716830272526, gammasch9 => 2.9517438169783246, w_snf_sak => 1.132649229920907, 
gammasnf => 0.7243545642175336, w_snf_glc => 1.4227670694144834, w_snf => 0.32464632554922157, 
w_torc_egoin => 0.6320329127410665, w_torc_ego => 1.0293030153698601, w_torc => 0.33908276222471906, 
w_torc_snf => 0.5627260805104367, w_torc_glut => 1.5539874103707414, gammator => 4.767784720571355, 
w_tps_pka => 1.1821915364111435, gammatps => 1.0502044269195572, w_tps => 0.01421454474969244, 
w_tre => 0.7169530050152036, gammatre => 0.7687385062810923, w_tre_pka => 8.412748392489899, 
k_camp_cyr => 3.8238530492568787, k_camp_deg => 0.024634668345843064, k_camp_pde => 10.062551872385388, 
w_eif_gcn2 => 0.418875925117752, gammaeif => 1.3510931647965105, w_eif => 2.9038537977882704]

p_conc_alt1 = vcat(p_const, p_var_alt_1)

#Alt2
Color_alt_2 = RGB(255/255,156/255,91/255)
label_alt_2 = "Parametervektor 2"

p_var_alt_2 = [gammacyr => 7.37813213215515, w_cyr_glu => 4.0997184519675685, w_cyr_snf => 0.15618803057097008, 
w_cyr => 1.185464238821411, w_dot => 0.4111950209759053, w_dot_sch_pka => 0.1503256183734567, 
w_ego => 0.17637124054254413, w_ego_basal => 0.01210236974294936, gammaego => 28.126358175661938, 
w_ego_gap => 3.237868986459061, gammagap => 0.5612427739487568, w_gap_torc => 74.83866008764363, 
w_gap_N => 11.874790200511052, gamma_gcn2 => 4.090316901581333, w_gcn_torc => 0.9896133346495836, 
w_gcn => 0.11452929251704766, w_gcn4_gcn2_trna => 1.0378678579818184, w_gcn4 => 0.8080253187256702, 
tRNA_sensitivity => 51.475300198167155, tRNA_total => 1.4165830774039265, w_gis => 0.9598913559028704, 
w_gis_pka => 2.2531749789281474, w_gis_sch => 0.39962868796936074, w_gln1_gln3 => 0.42656401845447395, 
w_gln1 => 0.23205314705787253, gammagln1 => 0.0748697315567821, w_gln_snf => 3.88332897305385, 
w_gln_sit => 0.499946743845947, w_gln3 => 0.8291893830375339, gammagln3 => 0.05684170975136388, 
k_acc_pro => 0.0009580425315539306, k_acc_glu => 0.0382698796749601, k_degr => 0.06109799788770438, 
k_acc_nh4 => 0.0010633379425814037, w_mig_snf => 1.1045407402569298, w_mig => 10.682656304179545, 
gamma_mig => 0.6301801949743072, w_mig_pka => 2.0702815313415317, gammapde => 0.24563706382038622, 
w_pde_pka => 2.740532823678456, w_pde => 0.24578161145053465, w_pka => 0.07651914481742461, 
w_pka_sch9 => 21.26180902280174, w_pka_camp => 92.33570214540178, gammapka => 2.0363410326848514, 
k_pr => 0.036864618632475865, w_ras_pka => 1.7059571669418776, gammaras => 1.5457443238793085, 
w_ras_glu => 0.4173960535668054, w_ras => 0.020403077111805366, k_mRNA_degr => 0.07321278881387466, 
k_transcription => 0.30586390645462325, w_rtg => 0.11476698861371079, w_rtg_torc => 0.5694031108190232, 
w_sak => 0.21376050520530604, w_sak_pka => 0.37341585131038835, w_sch9_torc => 1.8291717826570042, 
w_sch9 => 0.6809949019873669, gammasch9 => 2.848067541686701, w_snf_sak => 1.6514510153607276, 
gammasnf => 0.7872467094399845, w_snf_glc => 1.04913300835961, w_snf => 0.15981101514355836, 
w_torc_egoin => 0.21074325679400258, w_torc_ego => 0.45325285966873063, w_torc => 0.3985465334961566, 
w_torc_snf => 0.41082901282469547, w_torc_glut => 0.8002347014939227, gammator => 5.217018084103047, 
w_tps_pka => 0.43402968635316597, gammatps => 0.33650873776774165, w_tps => 0.027677950465241026, 
w_tre => 1.0427720464617893, gammatre => 0.2491200987057159, w_tre_pka => 2.8906249963284982, 
k_camp_cyr => 6.834825028889938, k_camp_deg => 0.052875098172279325, k_camp_pde => 11.19861069411881, 
w_eif_gcn2 => 0.21385697180334579, gammaeif => 0.5726657082381318, w_eif => 3.718324521854869]

p_conc_alt2 = vcat(p_const, p_var_alt_2)

#Jalihal
Color_jalihal = RGB(59/255,129/255,131/255)
label_jalihal = "Jalihal"

p_var_jalihal = [gammacyr => 8.96, w_cyr_glu => 5.13, w_cyr_snf => 0.12, w_cyr => 1.35, # Cyr1
w_dot => 0.29, w_dot_sch_pka => 0.16, # Dot6
w_ego => 0.28, w_ego_basal => 0.01, gammaego => 50.66, w_ego_gap => 2.21, # EGO
gammagap => 0.56, w_gap_torc => 88.33, w_gap_N => 7.76, # EGOGAP
gamma_gcn2 => 4.71, w_gcn_torc => 1.29, w_gcn => 0.12, # Gcn2
w_gcn4_gcn2_trna => 1.53, w_gcn4 => 0.74, tRNA_sensitivity => 74.51, tRNA_total => 2.47, # Gcn4
w_gis => 1.3, w_gis_pka => 3.3, w_gis_sch => 0.84, #Gis1
w_gln1_gln3 => 0.52, w_gln1 => 0.22, gammagln1 => 0.06, # Gln1
w_gln_snf => 3.9, w_gln_sit => 0.86, w_gln3 => 0.64, gammagln3 => 0.08, # Gln3
k_acc_pro => 0.0, k_acc_glu => 0.05, k_degr => 0.09, k_acc_nh4 => 0.0, # Glutamine
w_mig_snf => 1.21, w_mig => 10.64, gamma_mig => 0.66, w_mig_pka => 2.31, # Mig1
gammapde => 0.28, w_pde_pka => 2.89, w_pde => 0.38, # PDE
w_pka => 0.06, w_pka_sch9 => 17.5, w_pka_camp => 102.11, gammapka => 2.68, # PKA
k_pr => 0.02, # Protein
w_ras_pka => 1.87, gammaras => 1.82, w_ras_glu => 0.21, w_ras => 0.02, # Ras
k_mRNA_degr => 0.07, k_transcription => 0.24, # Rib
w_rtg => 0.19, w_rtg_torc => 0.88, # Rtg13
w_sak => 0.21, w_sak_pka => 0.38, # Sak
w_sch9_torc => 1.96, w_sch9 => 0.57, gammasch9 => 4.63, # Sch9
w_snf_sak => 1.52, gammasnf => 0.82, w_snf_glc => 1.15, w_snf => 0.54, # Snf1
w_torc_egoin => 0.3, w_torc_ego => 0.88, w_torc => 0.54, w_torc_snf => 0.44, w_torc_glut => 0.86, gammator => 7.55, # TORC1
w_tps_pka => 0.57, gammatps => 0.47, w_tps => 0.05, # Tps1
w_tre => 1.07, gammatre => 0.34, w_tre_pka => 3.07, # Trehalase
k_camp_cyr => 10.87, k_camp_deg => 0.08, k_camp_pde => 14.12, # cAMP
w_eif_gcn2 => 0.28, gammaeif => 0.47, w_eif => 3.73] # eIF

p_conc_jalihal = vcat(p_const, p_var_jalihal)