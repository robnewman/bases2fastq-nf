process BASES2FASTQ {
    tag "$id"
    label 'process_high'
    scratch true

    container "${params.b2f_container_url}:${params.b2f_container_tag}"

    input:
    val id
    path run_dir
    path run_manifest_csv, stageAs: 'custom_manifest/*'

    output:
    // run level metrics
    path "results/Metrics.csv"                     , emit: metrics_csv
    path "results/IndexAssignment.csv"             , emit: index_assignment_csv
    path "results/RunManifest.csv"                 , emit: run_manifest_csv
    path "results/RunManifest.json"                , emit: run_manifest_json
    path "results/RunParameters.json"              , emit: run_parameter_json
    path "results/RunStats.json"                   , emit: run_stats
    path "results/UnassignedSequences.csv"         , emit: unassigned_csv
    path "results/*_QC.html"                       , emit: qc_html
    // for --no-projects flag applied
    path "results/Samples/**.fastq.gz"             , optional: true, emit: sample_fastq
    path "results/Samples/**_stats.json"           , optional: true, emit: sample_json
    path "results/Samples/**_RunStats.json"        , optional: true, emit: json
    // for default structure (with projects)
    path "results/Samples/**_QC.html"              , optional: true, emit: project_qc_html
    path "results/Samples/**_Metrics.csv"          , optional: true, emit: project_metrics_csv
    path "results/Samples/**_IndexAssignment.csv"  , optional: true, emit: project_index_assignment_csv
    // b2f logs/info
    path "results/info/Bases2Fastq.log"            , emit: b2f_log
    path "results/info/RunManifestErrors.json"     , optional: true, emit: manifest_errors_json
    // run logs/versions
    path "run.log"                         , emit: log
    path "versions.yml"                    , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def b2f_options = params.b2f_args ?: ''
    def run_manifest_option = run_manifest_csv ? "-r ${run_manifest_csv}" : ''

    """
    logfile=run.log
    exec > >(tee \$logfile)
    exec 2>&1

    echo "${params.b2f_container_url}:${params.b2f_container_tag}"
    echo "bases2fastq ${run_dir} . -p ${task.cpus} ${run_manifest_option} ${b2f_options}"

    bases2fastq \\
        ${run_dir} \\
        results/ \\
        -p ${task.cpus} \\
        ${run_manifest_option} \\
        ${b2f_options}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        bases2fastq: \$(bases2fastq --version | sed -e "s/bases2fastq version //g")
    END_VERSIONS
    """
}
