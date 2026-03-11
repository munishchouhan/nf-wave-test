include { hello } from './modules/foo'
include { align_and_call } from './modules/bar'
include { generate_data } from './modules/generate_data'
include { quality_control } from './modules/quality_control'
include { compute_stats } from './modules/compute_stats'
include { aggregate_results } from './modules/aggregate_results'

workflow {
  // Stage 1: Greeting and data generation (parallel)
  hello()
  generate_data()

  // Stage 2: QC and alignment (depend on data generation)
  quality_control(generate_data.out)
  align_and_call(generate_data.out)

  // Stage 3: Compute statistics on aligned data
  compute_stats(align_and_call.out)

  // Stage 4: Aggregate all results
  aggregate_results(
    quality_control.out.mix(compute_stats.out).collect()
  )
}
