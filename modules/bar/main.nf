process align_and_call {
  debug true

  input:
  path data_files

  output:
  path "aligned_output.txt"

  """
  echo "Starting alignment at \$(date)"
  samtools --version

  # Simulate alignment work
  for i in \$(seq 1 5); do
    echo "Aligning batch \$i/5..."
    sleep 60
    echo "Batch \$i complete at \$(date)"
  done

  echo "Alignment finished at \$(date)" > aligned_output.txt
  cat ${data_files} >> aligned_output.txt
  """
}