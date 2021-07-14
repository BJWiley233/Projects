#! /usr/bin/bash

INPUT=$1
#SUBDIR=$2
FINAL_DIR=$2

bamid1=final.VerifyBamId.depthSM
bamid2=final.VerifyBamId.selfSM
summary=final.AlignmentSummaryMetrics.txt
hs1=final.roi-HsMetrics.txt
hs2=final.target-acmg_genes-HsMetrics.txt
hs3=final.base-clinvar-HsMetrics.txt
insert=final.InsertSizeMetrics.txt
dups=final.merged.NameSorted.mark_dups_metrics.txt
flag=final.bam.flagstat
fastqc1=final_fastqc.html
fastqc2=final_fastqc.zip

while read p; do
	sample=$(echo "$p" | awk '{print $2}')
	results=$(echo "$p" | awk '{print $3"/results"}')

  cp "${results}/${bamid1}" ${FINAL_DIR}/$(echo "${bamid1}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${bamid1}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${bamid2}" ${FINAL_DIR}/$(echo "${bamid2}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${bamid2}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${summary}" ${FINAL_DIR}/$(echo "${summary}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${summary}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${hs1}" ${FINAL_DIR}/$(echo "${hs1}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${hs1}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${hs2}" ${FINAL_DIR}/$(echo "${hs2}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${hs2}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${hs3}" ${FINAL_DIR}/$(echo "${hs3}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${hs3}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${insert}" ${FINAL_DIR}/$(echo "${insert}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${insert}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${dups}" ${FINAL_DIR}/$(echo "${dups}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${dups}" | awk -v sample=$sample '{gsub("final", sample); print}')

  cp "${results}/${flag}" ${FINAL_DIR}/$(echo "${flag}" | awk -v sample=$sample '{gsub("final", sample); print}')
  sed -i "s/final/$sample/g" ${FINAL_DIR}/$(echo "${flag}" | awk -v sample=$sample '{gsub("final", sample); print}')


  cp "${results}/${fastqc1}" ${FINAL_DIR}/$(echo "${fastqc1}" | awk -v sample=$sample '{gsub("final", sample); print}')

  fastqc_zip=${FINAL_DIR}/$(echo "${fastqc2}" | awk -v sample=$sample '{gsub("final", sample); print}')
  cp "${results}/${fastqc2}" $fastqc_zip
	unzip $fastqc_zip && rm $fastqc_zip && sed "s/final/$sample/" ${FINAL_DIR}/final_fastqc/fastqc_data.txt > ${FINAL_DIR}/final_fastqc/tmp.txt && mv ${FINAL_DIR}/final_fastqc/tmp.txt ${FINAL_DIR}/final_fastqc/fastqc_data.txt && zip -r $fastqc_zip ${FINAL_DIR}/final_fastqc && rm -r ${FINAL_DIR}/final_fastqc
