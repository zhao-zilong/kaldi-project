#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
gunzip -c exp/nnet4a/decode/phone_stats.*.gz | steps/diagnostic/analyze_phone_length_stats.py exp/tri3c/graph 
EOF
) >exp/nnet4a/decode/log/analyze_alignments.log
time1=`date +"%s"`
 ( gunzip -c exp/nnet4a/decode/phone_stats.*.gz | steps/diagnostic/analyze_phone_length_stats.py exp/tri3c/graph  ) 2>>exp/nnet4a/decode/log/analyze_alignments.log >>exp/nnet4a/decode/log/analyze_alignments.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/log/analyze_alignments.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/log/analyze_alignments.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/q/done.25892
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/q/analyze_alignments.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/q/analyze_alignments.sh >>exp/nnet4a/decode/q/analyze_alignments.log 2>&1
