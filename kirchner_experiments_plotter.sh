#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Kirchner Experiments Plotter Script!"

mkdir -p out/kirchner
mkdir -p out/alizadeh_inverted_field

print_in_color "\033[0;34m" "Generating Graphics: 1/-"
./run.sh -gline_graphic -okirchner/kirchner_fig5a.png -iin/kirchner/config/kirchner_fig5a_config.txt --xlabel="ks" --ylabel="Timesteps" --only-save-fig --no-marker

print_in_color "\033[0;34m" "Generating Graphics: 2/-"
./run.sh -gline_graphic -okirchner/kirchner_fig5b.png -iin/kirchner/config/kirchner_fig5b_config.txt --xlabel="kd" --ylabel="Timesteps" --only-save-fig --no-marker

print_in_color "\033[0;34m" "Generating Graphics: 3/-"
./run.sh -gline_graphic -okirchner/kirchner_fig7a.png -iin/kirchner/config/kirchner_fig7a_config.txt --xlabel="kd" --ylabel="Timesteps" --only-save-fig --no-marker

print_in_color "\033[0;34m" "Generating Graphics: 4/-"
./run.sh -gline_graphic -okirchner/kirchner_fig7b.png -iin/kirchner/config/kirchner_fig7b_config.txt --xlabel="kd" --ylabel="Timesteps" --only-save-fig --no-marker

print_in_color "\033[0;34m" "Generating Graphics: 5/-"
./run.sh -gline_graphic -okirchner/kirchner_fig8a.png -iin/kirchner/config/kirchner_fig8a_config.txt --xlabel="alpha" --ylabel="Timesteps" --only-save-fig --no-marker

print_in_color "\033[0;34m" "Generating Graphics: 6/-"
./run.sh -gline_graphic -okirchner/kirchner_fig8b.png -iin/kirchner/config/kirchner_fig8b_config.txt --xlabel="alpha" --ylabel="Timesteps" --only-save-fig --no-marker



#print_in_color "\033[0;34m" "Dynamic Example: 1/3"
#./run.sh -g3d_environment_heatmap -okirchner/dynamic_initial_example.png -iin/kirchner/kirchner_dynamic_initial_example.txt --only-save-fig
#
#print_in_color "\033[0;34m" "Dynamic Example: 2/3"
#./run.sh -g3d_environment_heatmap -okirchner/dynamic_medium_example.png -iin/kirchner/kirchner_dynamic_medium_example.txt --only-save-fig
#
#print_in_color "\033[0;34m" "Dynamic Example: 3/3"
#./run.sh -g3d_environment_heatmap -okirchner/dynamic_final_example.png -iin/kirchner/kirchner_dynamic_final_example.txt --only-save-fig

print_in_color "\033[0;34m" "Dynamic Example 2D: 1/3"
./run.sh -genvironment_heatmap -okirchner/dynamic_initial_example_2d.png -iin/kirchner/kirchner_dynamic_initial_example.txt --only-save-fig

print_in_color "\033[0;34m" "Dynamic Example 2D: 2/3"
./run.sh -genvironment_heatmap -okirchner/dynamic_medium_example_2d.png -iin/kirchner/kirchner_dynamic_medium_example.txt --only-save-fig

print_in_color "\033[0;34m" "Dynamic Example 2D: 3/3"
./run.sh -genvironment_heatmap -okirchner/dynamic_final_example_2d.png -iin/kirchner/kirchner_dynamic_final_example.txt --only-save-fig



#print_in_color "\033[0;34m" "Inverted Alizadeh Static Field Heatmap: 1/3"
#./run.sh -genvironment_heatmap -oalizadeh_inverted_field/alizadeh_inverted_fig2a_obstacles_0.png -iin/alizadeh_inverted_field/alizadeh_inverted_fig2a_obstacles_0.txt --only-save-fig --wall-threshold=-1000
#
#print_in_color "\033[0;34m" "Inverted Alizadeh Static Field Heatmap: 2/3"
#./run.sh -genvironment_heatmap -oalizadeh_inverted_field/alizadeh_inverted_fig2a_obstacles_20.png -iin/alizadeh_inverted_field/alizadeh_inverted_fig2a_obstacles_20.txt --only-save-fig --wall-threshold=-1000
#
#print_in_color "\033[0;34m" "Inverted Alizadeh Static Field Heatmap: 3/3"
#./run.sh -genvironment_heatmap -oalizadeh_inverted_field/alizadeh_inverted_fig2a_obstacles_40.png -iin/alizadeh_inverted_field/alizadeh_inverted_fig2a_obstacles_40.txt --only-save-fig --wall-threshold=-1000
#
#print_in_color "\033[0;34m" "Inverted Alizadeh Static Field Heatmap: 4/3"
#./run.sh -genvironment_heatmap -oalizadeh_inverted_field/varas_inverted_fig2a_obstacles_static.png -iin/alizadeh_inverted_field/varas_inverted_fig2a_obstacles_static.txt --only-save-fig --wall-threshold=-1000
#
#print_in_color "\033[0;34m" "Inverted Alizadeh Static Field Heatmap: 5/3"
#./run.sh -genvironment_heatmap -oalizadeh_inverted_field/varas_fig2a_obstacles_static.png -iin/alizadeh_inverted_field/varas_fig2a_obstacles_static.txt --only-save-fig --wall-threshold=-1000
