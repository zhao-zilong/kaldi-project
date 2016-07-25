#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
cat exp/nnet4a/decode/scoring_kaldi/wer_details/per_utt | utils/scoring/wer_ops_details.pl --special-symbol '***' | sort -b -i -k 1,1 -k 4,4rn -k 2,2 -k 3,3 > exp/nnet4a/decode/scoring_kaldi/wer_details/ops 
EOF
) >exp/nnet4a/decode/scoring_kaldi/log/stats2.log
time1=`date +"%s"`
 ( cat exp/nnet4a/decode/scoring_kaldi/wer_details/per_utt | utils/scoring/wer_ops_details.pl --special-symbol '***' | sort -b -i -k 1,1 -k 4,4rn -k 2,2 -k 3,3 > exp/nnet4a/decode/scoring_kaldi/wer_details/ops  ) 2>>exp/nnet4a/decode/scoring_kaldi/log/stats2.log >>exp/nnet4a/decode/scoring_kaldi/log/stats2.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/scoring_kaldi/log/stats2.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/scoring_kaldi/log/stats2.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/scoring_kaldi/q/done.26827
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/scoring_kaldi/q/stats2.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/scoring_kaldi/q/stats2.sh >>exp/nnet4a/decode/scoring_kaldi/q/stats2.log 2>&1
