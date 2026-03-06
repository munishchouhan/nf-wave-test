process align_and_call {
  debug true
  """
  # Create a small reference FASTA
  printf ">chr1\\nATCGATCGATCGATCGATCGATCGATCGATCGATCGATCG\\n>chr2\\nGGCCTTAAGGCCTTAAGGCCTTAAGGCCTTAA\\n" > ref.fa

  # Index the reference
  samtools faidx ref.fa
  echo "=== Reference Index ==="
  cat ref.fa.fai

  # Create a synthetic SAM file with a few reads
  cat <<SAM > reads.sam
@HD	VN:1.6	SO:unsorted
@SQ	SN:chr1	LN:40
@SQ	SN:chr2	LN:32
read1	0	chr1	1	60	10M	*	0	0	ATCGATCGAT	*
read2	0	chr1	15	60	10M	*	0	0	ATCGATCGAT	*
read3	16	chr2	5	60	8M	*	0	0	TTAAGGCC	*
read4	0	chr2	10	60	10M	*	0	0	GGCCTTAAGG	*
SAM

  # Convert SAM to BAM, sort, and index
  samtools view -bS reads.sam | samtools sort -o sorted.bam
  samtools index sorted.bam

  # Alignment statistics
  echo "=== Flagstat ==="
  samtools flagstat sorted.bam

  # Per-chromosome coverage depth
  echo "=== Depth Summary ==="
  samtools depth sorted.bam | awk '{sum[\$1]+=\$3; cnt[\$1]++} END {for (c in sum) print c, "avg_depth:", sum[c]/cnt[c]}'

  # Simple variant calling
  echo "=== Variant Calling ==="
  bcftools mpileup -f ref.fa sorted.bam | bcftools call -mv -Ov | grep -v "^#" | head -20 || echo "No variants detected (reads match reference)"

  echo "=== Pipeline Complete ==="
  """
}