process align_and_call {
  debug true
  """
  echo ">seq1" > ref.fa
  echo "ATCGATCGATCGATCGATCG" >> ref.fa
  samtools faidx ref.fa
  cat ref.fa.fai
  """
}