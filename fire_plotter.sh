#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Fogo Experimentos"

mkdir -p out/fogo

print_in_color "\033[0;34m" "dead pedestrains silva_Laboratory"
./run.sh -gcolumn_graphic -ofogo/silva_laboratory_dead.png -iin/fogo_new/config/fogo_silva_laboratory_dead_config.txt \
--only-save-fig --xlabel="Posição do Fogo" --ylabel="Óbitos"

print_in_color "\033[0;34m" "dead pedestrains daniel_anfiteatro"
./run.sh -gcolumn_graphic -ofogo/daniel_anfiteatro_dead.png -iin/fogo_new/config/fogo_daniel_anfiteatro_dead_config.txt \
--only-save-fig --xlabel="Posição do Fogo" --ylabel="Óbitos"

print_in_color "\033[0;34m" "dead pedestrains silva_Laboratory traversable-off"
./run.sh -gcolumn_graphic -ofogo/silva_laboratory_dead_traversable_off.png -iin/fogo_new/config/fogo_silva_laboratory_dead_traversable_off_config.txt \
--only-save-fig --xlabel="Posição do Fogo" --ylabel="Óbitos"

print_in_color "\033[0;34m" "dead pedestrains daniel_anfiteatro traversable-off"
./run.sh -gcolumn_graphic -ofogo/daniel_anfiteatro_dead_traversable_off.png -iin/fogo_new/config/fogo_daniel_anfiteatro_dead_traversable_off_config.txt \
--only-save-fig --xlabel="Posição do Fogo" --ylabel="Óbitos"

print_in_color "\033[0;34m" "pedestrians no ambiente daniel_anfiteatro centro"
./run.sh -gline_graphic -ofogo/daniel_anfiteatro_no_ambiente_centro.png -iin/fogo_new/config/pedestres_ambiente_anfiteatro_fogo_centro_config.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente daniel_anfiteatro centro inferior"
./run.sh -gline_graphic -ofogo/daniel_anfiteatro_no_ambiente_centro_inferior.png -iin/fogo_new/config/pedestres_ambiente_anfiteatro_fogo_centro_inferior_config.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente daniel_anfiteatro fileiras"
./run.sh -gline_graphic -ofogo/daniel_anfiteatro_no_ambiente_fileiras.png -iin/fogo_new/config/pedestres_ambiente_anfiteatro_fogo_fileiras_config.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente daniel_anfiteatro porta esquerda"
./run.sh -gline_graphic -ofogo/daniel_anfiteatro_no_ambiente_porta_esquerda.png -iin/fogo_new/config/pedestres_ambiente_anfiteatro_fogo_porta_esquerda_config.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente daniel_anfiteatro superior"
./run.sh -gline_graphic -ofogo/daniel_anfiteatro_no_ambiente_superior.png -iin/fogo_new/config/pedestres_ambiente_anfiteatro_fogo_superior_config.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente silva_Laboratory corredor centro"
./run.sh -gline_graphic -ofogo/silva_laboratory_no_ambiente_corredor_centro.png -iin/fogo_new/config/pedestres_ambiente_silva_laboratory_corredor_centro.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente silva_Laboratory corredor direita"
./run.sh -gline_graphic -ofogo/silva_laboratory_no_ambiente_corredor_direita.png -iin/fogo_new/config/pedestres_ambiente_silva_laboratory_corredor_direita.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente silva_Laboratory corredor esquerda"
./run.sh -gline_graphic -ofogo/silva_laboratory_no_ambiente_corredor_esquerda.png -iin/fogo_new/config/pedestres_ambiente_silva_laboratory_corredor_esquerda.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente silva_Laboratory filerias esquerda"
./run.sh -gline_graphic -ofogo/silva_laboratory_no_ambiente_fileiras_esquerda.png -iin/fogo_new/config/pedestres_ambiente_silva_laboratory_fileiras_esquerda.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker

print_in_color "\033[0;34m" "pedestrians no ambiente silva_Laboratory fileiras centro"
./run.sh -gline_graphic -ofogo/silva_laboratory_no_ambiente_fileiras_centro.png -iin/fogo_new/config/pedestres_ambiente_silva_laboratory_fileiras_centro.txt \
--only-save-fig --xlabel="Timestep" --ylabel="Pedestres no Ambiente" --no-marker