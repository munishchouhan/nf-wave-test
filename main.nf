include { hello } from './modules/foo'
include { align_and_call } from './modules/bar'

workflow {
  hello()
  align_and_call()
}


