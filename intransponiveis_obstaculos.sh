#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Obstaculos Intransponiveis Experimentos"

mkdir -p out/obstaculos_intransponiveis

print_in_color "\033[0;34m" "fig2a_obstacles"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/fig2a_obstacles_bar.png -iin/obstaculos_intransponiveis/fig2a_obstacles/fig2a_obstacles_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "fig2a"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/fig2a_bar.png -iin/obstaculos_intransponiveis/fig2a/fig2a_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "fig2b"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/fig2b_bar.png -iin/obstaculos_intransponiveis/fig2b/fig2b_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "alizadeh_crowd"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/alizadeh_crowd_bar.png -iin/obstaculos_intransponiveis/alizadeh_crowd/alizadeh_crowd_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "daniel_classroom"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/daniel_classroom_bar.png -iin/obstaculos_intransponiveis/daniel_classroom/daniel_classroom_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "daniel_classroom_dense"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/daniel_classroom_dense_bar.png -iin/obstaculos_intransponiveis/daniel_classroom_dense/daniel_classroom_dense_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "alizadeh_restaurant_1"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/alizadeh_restaurant_1_bar.png -iin/obstaculos_intransponiveis/alizadeh_restaurant_1/alizadeh_restaurant_1_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "alizadeh_restaurant_2"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/alizadeh_restaurant_2_bar.png -iin/obstaculos_intransponiveis/alizadeh_restaurant_2/alizadeh_restaurant_2_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "silva_classroom"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/silva_classroom_bar.png -iin/obstaculos_intransponiveis/silva_classroom/silva_classroom_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"

print_in_color "\033[0;34m" "silva_laboratory"
./run.sh -gcolumn_graphic -oobstaculos_intransponiveis/silva_laboratory_bar.png -iin/obstaculos_intransponiveis/silva_laboratory/silva_laboratory_config.txt \
--only-save-fig --xlabel="Abordagem" --ylabel="Tempo Médio de Evacuação (timesteps)"