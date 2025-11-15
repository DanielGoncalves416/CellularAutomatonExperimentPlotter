#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Variação Cooldown x Traversability - Obstáculos Transponíveis"

DIR="obstaculos_transponiveis/cooldown_traversability_1000"
mkdir -p out/$DIR

XLABEL="\$\theta\$"

print_in_color "\033[0;34m" "alizadeh_restaurant_1"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_1_transponivel_lines.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/alizadeh_restaurant_1_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-legends

print_in_color "\033[0;34m" "alizadeh_restaurant_uniform 1"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_uniform_transponivel_lines_1.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/alizadeh_restaurant_uniform_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-legends

print_in_color "\033[0;34m" "alizadeh_restaurant_uniform 2"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_uniform_transponivel_lines_2.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/alizadeh_restaurant_uniform_config_2.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-legends

print_in_color "\033[0;34m" "silva_classroom"
./run.sh -gline_graphic -o$DIR/silva_classroom_transponivel_lines.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/silva_classroom_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-marker --no-legends

print_in_color "\033[0;34m" "silva_laboratory 1"
./run.sh -gline_graphic -o$DIR/silva_laboratory_transponivel_lines_1.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/silva_laboratory_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-legends

print_in_color "\033[0;34m" "silva_laboratory 2"
./run.sh -gline_graphic -o$DIR/silva_laboratory_transponivel_lines_2.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/silva_laboratory_config_2.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-legends

print_in_color "\033[0;34m" "daniel_anfiteatro"
./run.sh -gline_graphic -o$DIR/daniel_anfiteatro_transponivel_lines_1.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/daniel_anfiteatro_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-legends

print_in_color "\033[0;34m" "daniel_anfiteatro 2"
./run.sh -gline_graphic -o$DIR/daniel_anfiteatro_transponivel_lines_2.png -iin/transponiveis_variacao_cooldown_1000_simu/config_files/daniel_anfiteatro_config_2.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Tempo Médio de Evacuação (timesteps)" --no-legends




print_in_color "\033[0;32m" "Variação Cooldown x Traversability - Obstáculos Transponíveis - Fails"

DIR="obstaculos_transponiveis/cooldown_traversability_1000_fails"
mkdir -p out/$DIR

print_in_color "\033[0;34m" "alizadeh_restaurant_1"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_1_transponivel_lines_fails.png -iin/transponiveis_variacao_cooldown_1000_fails/config_files/alizadeh_restaurant_1_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Falhas"

print_in_color "\033[0;34m" "alizadeh_restaurant_uniform"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_uniform_transponivel_lines_fails.png -iin/transponiveis_variacao_cooldown_1000_fails/config_files/alizadeh_restaurant_uniform_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Falhas"

print_in_color "\033[0;34m" "silva_classroom"
./run.sh -gline_graphic -o$DIR/silva_classroom_transponivel_lines_fails.png -iin/transponiveis_variacao_cooldown_1000_fails/config_files/silva_classroom_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Falhas"

print_in_color "\033[0;34m" "silva_laboratory"
./run.sh -gline_graphic -o$DIR/silva_laboratory_transponivel_lines_fails.png -iin/transponiveis_variacao_cooldown_1000_fails/config_files/silva_laboratory_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Falhas"

print_in_color "\033[0;34m" "daniel_anfiteatro"
./run.sh -gline_graphic -o$DIR/daniel_anfiteatro_transponivel_lines_fails.png -iin/transponiveis_variacao_cooldown_1000_fails/config_files/daniel_anfiteatro_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Falhas"


print_in_color "\033[0;32m" "Variação Cooldown x Traversability - Obstáculos Transponíveis - Successes"


DIR="obstaculos_transponiveis/cooldown_traversability_1000_successes"
mkdir -p out/$DIR

print_in_color "\033[0;34m" "alizadeh_restaurant_1"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_1_transponivel_lines_successes.png -iin/transponiveis_variacao_cooldown_1000_successes/config_files/alizadeh_restaurant_1_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Sucessos"

print_in_color "\033[0;34m" "alizadeh_restaurant_uniform"
./run.sh -gline_graphic -o$DIR/alizadeh_restaurant_uniform_transponivel_lines_successes.png -iin/transponiveis_variacao_cooldown_1000_successes/config_files/alizadeh_restaurant_uniform_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Sucessos"

print_in_color "\033[0;34m" "silva_classroom"
./run.sh -gline_graphic -o$DIR/silva_classroom_transponivel_lines_successes.png -iin/transponiveis_variacao_cooldown_1000_successes/config_files/silva_classroom_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Sucessos"

print_in_color "\033[0;34m" "silva_laboratory"
./run.sh -gline_graphic -o$DIR/silva_laboratory_transponivel_lines_successes.png -iin/transponiveis_variacao_cooldown_1000_successes/config_files/silva_laboratory_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Sucessos"

print_in_color "\033[0;34m" "daniel_anfiteatro"
./run.sh -gline_graphic -o$DIR/daniel_anfiteatro_transponivel_lines_successes.png -iin/transponiveis_variacao_cooldown_1000_successes/config_files/daniel_anfiteatro_config.txt \
--only-save-fig --xlabel=$XLABEL --ylabel="Número Médio de Sucessos"
