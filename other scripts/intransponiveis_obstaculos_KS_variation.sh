#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Variação KS Obstaculos Intransponiveis Experimentos"
DIR=obstaculos_intransponiveis_variacao_KS
mkdir -p out/$DIR

print_in_color "\033[0;34m" "alizadeh_crowd"
./run.sh -gline_graphic -o$DIR/alizadeh_crowd_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/alizadeh_crowd_config.txt \
--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker

print_in_color "\033[0;34m" "alizadeh_restaurant_1"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_1_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/alizadeh_restaurant_1_config.txt \
--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker

#print_in_color "\033[0;34m" "daniel_classroom"
#./run.sh -gline_graphic -o$DIR/daniel_classroom_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/daniel_classroom_config.txt \
#--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker
#
#print_in_color "\033[0;34m" "daniel_classroom_dense"
#./run.sh -gline_graphic -o$DIR/daniel_classroom_dense_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/daniel_classroom_dense_config.txt \
#--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker

print_in_color "\033[0;34m" "fig2a"
./run.sh -gline_graphic -o$DIR/fig2a_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/fig2a_config.txt \
--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker

print_in_color "\033[0;34m" "fig2a_obstacles"
./run.sh -gline_graphic -o$DIR/fig2a_obstacles_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/fig2a_obstacles_config.txt \
--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker

print_in_color "\033[0;34m" "fig2b"
./run.sh -gline_graphic -o$DIR/fig2b_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/fig2b_config.txt \
--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker

#print_in_color "\033[0;34m" "silva_classroom"
#./run.sh -gline_graphic -o$DIR/silva_classroom_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/silva_classroom_config.txt \
#--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker
#
#print_in_color "\033[0;34m" "silva_laboratory"
#./run.sh -gline_graphic -o$DIR/silva_laboratory_lines_ks.png -iin/obstaculos_intransponiveis_KS_variacao/config_files/silva_laboratory_config.txt \
#--only-save-fig --xlabel="k_s" --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker