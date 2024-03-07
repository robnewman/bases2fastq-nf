#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

log.info """\
================================================
  B A S E S 2 F A S T Q - N F   P I P E L I N E
================================================
 id: ${params.id}
 run_dir: ${params.run_dir}
 outdir: ${params.outdir}
 b2f_args: ${params.b2f_args}
 b2f_container_url: ${params.b2f_container_url}
 b2f_container_tag: ${params.b2f_container_tag}
 """
 
include { BASES2FASTQ } from './modules/local/bases2fastq'

workflow {

    BASES2FASTQ (
        params.id,
        params.run_dir
     )
     
}
