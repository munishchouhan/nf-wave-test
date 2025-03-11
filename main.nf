include { hello } from './modules/foo'

include { hello1 } from './modules/bar'

workflow {
  hello()
  hello1()
}


