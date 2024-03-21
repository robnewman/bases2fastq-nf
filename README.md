**bases2fastq-nf** is a bioinformatics pipeline used to demultiplex the raw data produced by the Element AVITI™ System using the Bases2Fastq Software. Bases2Fastq processes sequencing data and converts base calls into FASTQ files. During a sequencing run, the Element AVITI™ System records base calls and associated quality scores (Q-scores) in bases files. Bases2Fastq converts the bases files into the FASTQ file format for secondary analysis with the FASTQ-compatible software of your choice. 

- The [Bases2Fastq Documentation](https://docs.dev.elembio.io/docs/bases2fastq/introduction/) has detailed execution information for changing parameters.
- The [Run Manifest Documentation](https://docs.dev.elembio.io/docs/run-manifest/) has detailed information for resetting demultiplexing settings, controlled by the input Run Manifest.
  
Bases2fastq-nf enables you to run Bases2Fastq on any environment that supports running nextflow. 


## nextflow run commands

```
nextflow run . -profile test
nextflow run . -profile test_index_fastq
nextflow run . -profile test_legacy_fastq
nextflow run . -profile test_projects
nextflow run . -profile test_qc_only
nextflow run . -profile test_custom_manifest_s3
nextflow run . -profile test_custom_manifest_local
nextflow run . -profile test_custom_manifest_rundir
nextflow run . -profile test_s3
nextflow run . -profile test_s3_zipped
```

## Run nf-test
```
nf-test test

```

## License
Use subject to license available at go.elembio.link/eula.
