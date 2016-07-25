#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-shuffle-egs --srand=$[${SGE_TASK_ID}+(8*3)] ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.3.ark ark:exp/nnet4a/egs/egs.${SGE_TASK_ID}.3.ark 
EOF
) >exp/nnet4a/log/shuffle.3.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( nnet-shuffle-egs --srand=$[${SGE_TASK_ID}+(8*3)] ark:exp/nnet4a/egs/egs_tmp.${SGE_TASK_ID}.3.ark ark:exp/nnet4a/egs/egs.${SGE_TASK_ID}.3.ark  ) 2>>exp/nnet4a/log/shuffle.3.$SGE_TASK_ID.log >>exp/nnet4a/log/shuffle.3.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/shuffle.3.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/shuffle.3.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.29349.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/shuffle.3.log -l mem_free=10G,ram_free=2G,arch=*64 -tc 5   -t 1:8 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/shuffle.3.sh >>exp/nnet4a/q/shuffle.3.log 2>&1
