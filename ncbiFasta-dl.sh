#/bin/bash
xargs -a accession_list.txt -n 1 -I {} sh -c '
    esearch -db assembly -query "$1" | \
    elink -target nuccore -name assembly_nuccore_refseq | \
    efetch -format fasta > "$1.fasta" && \
    echo "Accession $1 downloaded successfully"
' -- {}
