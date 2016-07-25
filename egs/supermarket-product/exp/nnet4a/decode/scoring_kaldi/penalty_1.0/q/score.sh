#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
cat exp/nnet4a/decode/scoring_kaldi/penalty_1.0/${SGE_TASK_ID}.txt | compute-wer --text --mode=present ark:exp/nnet4a/decode/scoring_kaldi/test_filt.txt ark,p:- >& exp/nnet4a/decode/wer_${SGE_TASK_ID}_1.0 
EOF
) >exp/nnet4a/decode/scoring_kaldi/penalty_1.0/log/score.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( cat exp/nnet4a/decode/scoring_kaldi/penalty_1.0/${SGE_TASK_ID}.txt | compute-wer --text --mode=present ark:exp/nnet4a/decode/scoring_kaldi/test_filt.txt ark,p:- >& exp/nnet4a/decode/wer_${SGE_TASK_ID}_1.0  ) 2>>exp/nnet4a/decode/scoring_kaldi/penalty_1.0/log/score.$SGE_TASK_ID.log >>exp/nnet4a/decode/scoring_kaldi/penalty_1.0/log/score.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/scoring_kaldi/penalty_1.0/log/score.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/scoring_kaldi/penalty_1.0/log/score.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/scoring_kaldi/penalty_1.0/q/done.26588.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/scoring_kaldi/penalty_1.0/q/score.log -l mem_free=10G,ram_free=2G,arch=*64   -t 9:20 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/scoring_kaldi/penalty_1.0/q/score.sh >>exp/nnet4a/decode/scoring_kaldi/penalty_1.0/q/score.log 2>&1
