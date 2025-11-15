#!/bin/bash

# Prints the provided text in the given color.
# $1 Sequence code of the chosen color.
# $2 The string to be printed.
print_in_color()
{
    echo -e "$1$2\033[0m"
}

clear
print_in_color "\033[0;32m" "Varas Calculation Steps"

mkdir -p out/varas_calculation_steps

print_in_color "\033[0;34m" "Step 0"
./run.sh -genvironment_heatmap -ovaras_calculation_steps/varas_calcucation_step0.png -iin/varas/floor_calculation_steps/varas_calculation_step0.txt --only-save-fig

print_in_color "\033[0;34m" "Step 1"
./run.sh -genvironment_heatmap -ovaras_calculation_steps/varas_calcucation_step1.png -iin/varas/floor_calculation_steps/varas_calculation_step1.txt --only-save-fig

print_in_color "\033[0;34m" "Step 2"
./run.sh -genvironment_heatmap -ovaras_calculation_steps/varas_calcucation_step2.png -iin/varas/floor_calculation_steps/varas_calculation_step2.txt --only-save-fig

print_in_color "\033[0;34m" "Step 3"
./run.sh -genvironment_heatmap -ovaras_calculation_steps/varas_calcucation_step3.png -iin/varas/floor_calculation_steps/varas_calculation_step3.txt --only-save-fig

print_in_color "\033[0;34m" "Step 4"
./run.sh -genvironment_heatmap -ovaras_calculation_steps/varas_calcucation_step4.png -iin/varas/floor_calculation_steps/varas_calculation_step4.txt --only-save-fig
