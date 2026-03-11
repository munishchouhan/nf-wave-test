process compute_stats {
  debug true

  input:
  path aligned_data

  output:
  path "statistics.txt"

  """
  echo "Computing statistics on aligned data at \$(date)"

  # Simulate intensive statistical computation
  for metric in "coverage_depth" "mapping_quality" "insert_size_distribution" "mismatch_rate" "indel_frequency" "base_composition" "strand_bias" "gc_bias" "fragment_length" "chimeric_reads"; do
    echo "Computing \$metric..."

    # Simulate CPU-intensive work
    for j in \$(seq 1 1000); do
      echo "\$j" | md5sum > /dev/null
    done
    sleep 60

    echo "  \$metric: computed at \$(date)"
  done

  echo "Statistics Report" > statistics.txt
  echo "=================" >> statistics.txt
  echo "Input: ${aligned_data}" >> statistics.txt
  echo "Metrics computed: 10" >> statistics.txt
  echo "All metrics within expected ranges" >> statistics.txt
  echo "Completed at: \$(date)" >> statistics.txt

  echo "Statistics computation complete at \$(date)"
  """
}