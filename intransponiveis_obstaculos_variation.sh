#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Variação Obstaculos Intransponiveis Experimentos"

mkdir -p out/obstaculos_intransponiveis_variacao

XLABEL="\$k_{D}\$"

print_in_color "\033[0;34m" "alizadeh_crowd"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/alizadeh_crowd_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/alizadeh_crowd_config.txt \
--only-save-fig --xlabel="\$k_D\$" --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "alizadeh_restaurant_1"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/alizadeh_restaurant_1_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/alizadeh_restaurant_1_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "alizadeh_restaurant_2"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/alizadeh_restaurant_2_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/alizadeh_restaurant_2_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "alizadeh_restaurant_uniform"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/alizadeh_restaurant_uniform_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/alizadeh_restaurant_uniform_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "daniel_classroom"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/daniel_classroom_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/daniel_classroom_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "daniel_classroom_dense"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/daniel_classroom_dense_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/daniel_classroom_dense_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "fig2a"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/fig2a_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/fig2a_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "fig2a_obstacles"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/fig2a_obstacles_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/fig2a_obstacles_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "fig2b"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/fig2b_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/fig2b_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "silva_classroom"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/silva_classroom_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/silva_classroom_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker

print_in_color "\033[0;34m" "silva_laboratory"
./run.sh -gline_graphic -oobstaculos_intransponiveis_variacao/silva_laboratory_lines.png -iin/obstaculos_intransponiveis_variacao/config_files/silva_laboratory_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Média de Passos de tempo" --no-marker