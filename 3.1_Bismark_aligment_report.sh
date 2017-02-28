


#----------------------------Using HCT116_corrected_hg38 as reference genome for bismark---------------------------------------

#bismark
~/myprograms/Bismark/bismark --bowtie2 --multicore 64 --bam ../HCT116 -1 ./ftpdata.novogene.cn\:2300/sample_H/combine_hct116_WGBS_1.fq.gz -2 ./ftpdata.novogene.cn\:2300/sample_H/combine_hct116_WGBS_2.fq.gz

#bismark_methylation_extractor
~/myprograms/Bismark/bismark_methylation_extractor --multicore 60 --gzip --buffer_size 20G --paired-end --report --comprehensive --ample_memory --cytosine_report --CX_context --genome_folder ../HCT116 combine_hct116_WGBS_1_bismark_bt2_pe.bam
#gave wrong genome_folder, disrupted cytosine_report generation
#Re-run coverage2cytosine
~/myprograms/Bismark/coverage2cytosine --gzip --CX_context --genome_folder ../HCT116_corrected/ -o combine_hct116_WGBS_1_bismark_bt2_pe.coverage.report combine_hct116_WGBS_1_bismark_bt2_pe.bismark.cov.gz







#----------------------------Using minION reads as reference genome for bismark---------------------------------------

#bismark_genome_preparation (in a directory containing only the genome.fasta)
~/myprograms/Bismark/bismark_genome_preparation ./


#bismark
~/myprograms/Bismark/bismark --bowtie2 -D 20 -R 3 --multicore 62 --bam -o ./ --temp_dir ./ ../HCT116_minION_genome/ -1 ../HCT116_WGBS_novogene/ftpdata.novogene.cn\:2300/sample_H/combine_hct116_WGBS_1.fq.gz -2 ../HCT116_WGBS_novogene/ftpdata.novogene.cn\:2300/sample_H/combine_hct116_WGBS_2.fq.gz


#bismark_methylation_extractor
~/myprograms/Bismark/bismark_methylation_extractor --multicore 62 --gzip --buffer_size 20G --paired-end --report --comprehensive --ample_memory --cytosine_report --genome_folder ../HCT116_minION_genome/ ./combine_hct116_WGBS_1_bismark_bt2_pe.bam




