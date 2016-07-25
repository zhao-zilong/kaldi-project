#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-copy-egs --random=false --srand=${SGE_TASK_ID} "ark:cat exp/nnet4a/egs/egs_orig.${SGE_TASK_ID}.*.ark|" ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.0.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.1.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.2.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.3.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.4.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.5.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.6.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.7.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.8.ark 
EOF
) >exp/nnet4a/log/split_egs.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( nnet-copy-egs --random=false --srand=${SGE_TASK_ID} "ark:cat exp/nnet4a/egs/egs_orig.${SGE_TASK_ID}.*.ark|" ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.0.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.1.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.2.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.3.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.4.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.5.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.6.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.7.ark ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.8.ark  ) 2>>exp/nnet4a/log/split_egs.$SGE_TASK_ID.log >>exp/nnet4a/log/split_egs.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/split_egs.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/split_egs.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.28844.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/split_egs.log -l mem_free=10G,ram_free=2G,arch=*64 -tc 5   -t 1:8 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/split_egs.sh >>exp/nnet4a/q/split_egs.log 2>&1
