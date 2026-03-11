process aggregate_results {
  debug true

  input:
  path all_results

  output:
  path "final_report.txt"

  """
  echo "Aggregating all results at \$(date)"

  # Simulate report generation
  echo "=== Final Pipeline Report ===" > final_report.txt
  echo "Generated at: \$(date)" >> final_report.txt
  echo "" >> final_report.txt

  for f in ${all_results}; do
    echo "Processing result file: \$f"
    echo "--- \$f ---" >> final_report.txt
    cat \$f >> final_report.txt
    echo "" >> final_report.txt
    sleep 30
  done

  # Simulate final aggregation computation
  echo "Running final aggregation..."
  sleep 120

  echo "" >> final_report.txt
  echo "Pipeline completed successfully at: \$(date)" >> final_report.txt

  echo "Final report generated at \$(date)"
  cat final_report.txt
  """
}