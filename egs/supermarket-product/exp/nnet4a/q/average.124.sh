#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/125.1.mdl exp/nnet4a/125.2.mdl exp/nnet4a/125.3.mdl exp/nnet4a/125.4.mdl exp/nnet4a/125.5.mdl exp/nnet4a/125.6.mdl exp/nnet4a/125.7.mdl exp/nnet4a/125.8.mdl - | nnet-am-copy --learning-rates=0.00654084954307646:0.00327042477153823:0.00327042477153823 - exp/nnet4a/125.mdl 
EOF
) >exp/nnet4a/log/average.124.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/125.1.mdl exp/nnet4a/125.2.mdl exp/nnet4a/125.3.mdl exp/nnet4a/125.4.mdl exp/nnet4a/125.5.mdl exp/nnet4a/125.6.mdl exp/nnet4a/125.7.mdl exp/nnet4a/125.8.mdl - | nnet-am-copy --learning-rates=0.00654084954307646:0.00327042477153823:0.00327042477153823 - exp/nnet4a/125.mdl  ) 2>>exp/nnet4a/log/average.124.log >>exp/nnet4a/log/average.124.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.124.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.124.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.4472
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.124.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.124.sh >>exp/nnet4a/q/average.124.log 2>&1
