## bases2fastq-nf

Nextflow wrapper for Element Bases2Fastq

# nextflow run commands
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

# run nf-test
nf-test test
