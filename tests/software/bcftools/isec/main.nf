#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { BCFTOOLS_ISEC } from '../../../../software/bcftools/isec/main.nf' addParams( options: ['args': '--nfiles +2 --output-type z --no-version'] )

workflow test_bcftools_isec {

    def input = []
    input = [ [ id:'test' ], // meta map
              [ file("${launchDir}/tests/data/vcf/test.vcf.gz", checkIfExists: true),
                file("${launchDir}/tests/data/vcf/test2.vcf.gz", checkIfExists: true),
                file("${launchDir}/tests/data/vcf/test3.vcf.gz", checkIfExists: true)],
              [ file("${launchDir}/tests/data/vcf/test.vcf.gz.tbi", checkIfExists: true),
                file("${launchDir}/tests/data/vcf/test2.vcf.gz.tbi", checkIfExists: true),
                file("${launchDir}/tests/data/vcf/test3.vcf.gz.tbi", checkIfExists: true) ]]

    BCFTOOLS_ISEC ( input )

}
