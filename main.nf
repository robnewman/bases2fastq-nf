#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

log.info """\
 B A S E S 2 F A S T Q - N F   P I P E L I N E
 =============================================
 run_dir: ${params.run_dir}
 run_manifest_csv: ${params.run_manifest_csv}
 id: ${params.id}
 outdir: ${params.outdir}
 b2f_args: ${params.b2f_args}
 b2f_container_url: ${params.b2f_container_url}
 b2f_container_tag: ${params.b2f_container_tag}
 """

// Check mandatory parameters
//todo

// import local
include { BASES2FASTQ } from './modules/local/bases2fastq'

def run_manifest_csv = params.run_manifest_csv ? file(params.run_manifest_csv, checkIfExists: true) : []

workflow {

    BASES2FASTQ (
        params.id,
        params.run_dir,
        run_manifest_csv
     )
     
}
