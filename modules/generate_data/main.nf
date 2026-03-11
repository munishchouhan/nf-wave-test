process generate_data {
  debug true

  output:
  path "simulated_reads.txt"

  """
  echo "Generating simulated sequencing data at \$(date)"

  # Simulate data generation over several minutes
  for i in \$(seq 1 10); do
    echo "Generating read batch \$i/10..."
    # Generate random sequence data
    head -c 1000000 /dev/urandom | base64 | head -c 500000 >> simulated_reads.txt
    echo "" >> simulated_reads.txt
    sleep 60
    echo "Batch \$i complete at \$(date)"
  done

  echo "Data generation complete: \$(wc -l < simulated_reads.txt) lines generated"
  """
}