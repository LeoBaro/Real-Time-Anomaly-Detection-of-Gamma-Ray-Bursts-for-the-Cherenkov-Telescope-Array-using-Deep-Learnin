#!/bin/bash

# get the path to the current script
this_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

base_output_dir="$this_dir/testing"
mkdir -p $base_output_dir
echo "base_output_dir=$base_output_dir"

output_dir_sim="$base_output_dir/sim_output"

echo "Generating the photon list.."
#simGRBcatalogWithRandomization -f config_test_set.yml --output-dir $output_dir_sim --print no --mp-threads 10 2>&1 > $this_dir/simulation_test.log

echo "Generating AP data.."
data_dir="$base_output_dir/sim_output/run0406_ID000126"
ap_output_dir="$base_output_dir/ap_output"
ap_logs_output_dir="$base_output_dir/ap_logs_output"
mkdir -p $ap_logs_output_dir

#T=1 with-normalization
#sbatch --output="$ap_logs_output_dir/t1_norm.log" --wrap="generate_ap_data -c $this_dir/config_test_set.yml -dd $data_dir -off 0 -itype te -itime 1 -rr 0.2 -norm yes -out $ap_output_dir -proc 10"
#T=1 no-normalization
#sbatch --output="$ap_logs_output_dir/t1_no_norm.log" --wrap="generate_ap_data -c $this_dir/config_test_set.yml -dd $data_dir -off 0 -itype te -itime 1 -rr 0.2 -norm no -out $ap_output_dir -proc 10"
#T=5 with-normalization
#sbatch --output="$ap_logs_output_dir/t5_norm.log" --wrap="generate_ap_data -c $this_dir/config_test_set.yml -dd $data_dir -off 0 -itype te -itime 5 -rr 0.2 -norm yes -out $ap_output_dir -proc 10"
#T=5 no-normalization
#sbatch --output="$ap_logs_output_dir/t5_no_norm.log" --wrap="generate_ap_data -c $this_dir/config_test_set.yml -dd $data_dir -off 0 -itype te -itime 5 -rr 0.2 -norm no -out $ap_output_dir -proc 10"
#T=10 with-normalization
#sbatch --output="$ap_logs_output_dir/t10_norm.log" --wrap="generate_ap_data -c $this_dir/config_test_set.yml -dd $data_dir -off 0 -itype te -itime 10 -rr 0.2 -norm yes -out $ap_output_dir -proc 10"
#T=10 no-normalization
#sbatch --output="$ap_logs_output_dir/t10_no_norm.log" --wrap="generate_ap_data -c $this_dir/config_test_set.yml -dd $data_dir -off 0 -itype te -itime 10 -rr 0.2 -norm no -out $ap_output_dir -proc 10"


echo "Generating plots.."
plot_ap_timeseries -d "$base_output_dir/ap_output" -o "$base_output_dir/plot_output"

