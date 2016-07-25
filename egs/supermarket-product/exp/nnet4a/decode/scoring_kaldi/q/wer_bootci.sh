#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
compute-wer-bootci ark:exp/nnet4a/decode/scoring_kaldi/test_filt.txt ark:exp/nnet4a/decode/scoring_kaldi/penalty_0.0/9.txt > exp/nnet4a/decode/scoring_kaldi/wer_details/wer_bootci 
EOF
) >exp/nnet4a/decode/scoring_kaldi/log/wer_bootci.log
time1=`date +"%s"`
 ( compute-wer-bootci ark:exp/nnet4a/decode/scoring_kaldi/test_filt.txt ark:exp/nnet4a/decode/scoring_kaldi/penalty_0.0/9.txt > exp/nnet4a/decode/scoring_kaldi/wer_details/wer_bootci  ) 2>>exp/nnet4a/decode/scoring_kaldi/log/wer_bootci.log >>exp/nnet4a/decode/scoring_kaldi/log/wer_bootci.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/scoring_kaldi/log/wer_bootci.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/scoring_kaldi/log/wer_bootci.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/scoring_kaldi/q/done.26864
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/scoring_kaldi/q/wer_bootci.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/scoring_kaldi/q/wer_bootci.sh >>exp/nnet4a/decode/scoring_kaldi/q/wer_bootci.log 2>&1
