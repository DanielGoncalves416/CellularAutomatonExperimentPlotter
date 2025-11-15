#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Kirchner Static Field Plotter Script!"

dir_name=obstaculos_intransponiveis_piso_estatico
mkdir -p out/$dir_name

print_in_color "\033[0;34m" "alizadeh_crowd - PIV"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_crowd_PIV.txt \
          -o${dir_name}/alizadeh_Crowd_PIV_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_crowd - PIA 0"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_crowd_PIA_0.txt \
          -o${dir_name}/alizadeh_Crowd_PIA_0_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_crowd - PIA 45"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_crowd_PIA_45.txt \
          -o${dir_name}/alizadeh_Crowd_PIA_45_field.png --only-save-fig

print_in_color "\033[0;34m" "fig2b - PIV"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/fig2b_PIV.txt \
          -o${dir_name}/fig2b_PIV_field.png --only-save-fig

print_in_color "\033[0;34m" "fig2b - PIA 0"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/fig2b_PIA_0.txt \
          -o${dir_name}/fig2b_PIA_0_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_1 - PIV"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_1_PIV.txt \
          -o${dir_name}/alizadeh_restaurant_1_PIV_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_1 - PIA 0"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_1_PIA_0.txt \
          -o${dir_name}/alizadeh_restaurant_1_PIA_0_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_1 - PIA 45"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_1_PIA_45.txt \
          -o${dir_name}/alizadeh_restaurant_1_PIA_45_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_2 - PIV"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_2_PIV.txt \
          -o${dir_name}/alizadeh_restaurant_2_PIV_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_2 - PIA 0"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_2_PIA_0.txt \
          -o${dir_name}/alizadeh_restaurant_2_PIA_0_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_2 - PIA 45"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_2_PIA_45.txt \
          -o${dir_name}/alizadeh_restaurant_2_PIA_45_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_uniform - PIV"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_uniform_PIV.txt \
          -o${dir_name}/alizadeh_restaurant_uniform_PIV_field.png --only-save-fig

print_in_color "\033[0;34m" "alizadeh_restaurant_uniform - PIA 0"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/alizadeh_restaurant_uniform_PIA_0.txt \
          -o${dir_name}/alizadeh_restaurant_uniform_PIA_0_field.png --only-save-fig

# Force maximum value and horizontal colorbar

print_in_color "\033[0;34m" "fig2a - PIV"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/fig2a_PIV.txt \
          -o${dir_name}/fig2a_PIV_field.png --only-save-fig

print_in_color "\033[0;34m" "fig2a - PIA 15"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/fig2a_PIA_15.txt \
          -o${dir_name}/fig2a_PIA_15_field.png --only-save-fig

print_in_color "\033[0;34m" "fig2a - PIA 45"
./run.sh -genvironment_heatmap --wall-threshold=-1000 -iin/${dir_name}/fig2a_PIA_45.txt \
          -o${dir_name}/fig2a_PIA_45_field.png --only-save-fig