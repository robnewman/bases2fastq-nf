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
 container_url: ${params.container_url}
 container_tag: ${params.container_tag}
 """

// Check mandatory parameters
//todo

// import local
include { B2F } from './modules/local/b2f'

workflow {

    B2F (
        params.run_dir,
        params.id,
        params.run_manifest_csv
     )
}
