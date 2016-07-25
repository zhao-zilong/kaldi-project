#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
cat exp/nnet4a/decode/scoring_kaldi/penalty_0.0/9.txt | align-text --special-symbol='***' ark:exp/nnet4a/decode/scoring_kaldi/test_filt.txt ark:- ark,t:- | utils/scoring/wer_per_utt_details.pl --special-symbol '***' | tee exp/nnet4a/decode/scoring_kaldi/wer_details/per_utt | utils/scoring/wer_per_spk_details.pl data/test/utt2spk > exp/nnet4a/decode/scoring_kaldi/wer_details/per_spk 
EOF
) >exp/nnet4a/decode/scoring_kaldi/log/stats1.log
time1=`date +"%s"`
 ( cat exp/nnet4a/decode/scoring_kaldi/penalty_0.0/9.txt | align-text --special-symbol='***' ark:exp/nnet4a/decode/scoring_kaldi/test_filt.txt ark:- ark,t:- | utils/scoring/wer_per_utt_details.pl --special-symbol '***' | tee exp/nnet4a/decode/scoring_kaldi/wer_details/per_utt | utils/scoring/wer_per_spk_details.pl data/test/utt2spk > exp/nnet4a/decode/scoring_kaldi/wer_details/per_spk  ) 2>>exp/nnet4a/decode/scoring_kaldi/log/stats1.log >>exp/nnet4a/decode/scoring_kaldi/log/stats1.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/scoring_kaldi/log/stats1.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/scoring_kaldi/log/stats1.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/scoring_kaldi/q/done.26792
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/scoring_kaldi/q/stats1.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/scoring_kaldi/q/stats1.sh >>exp/nnet4a/decode/scoring_kaldi/q/stats1.log 2>&1
