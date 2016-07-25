#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/137.1.mdl exp/nnet4a/137.2.mdl exp/nnet4a/137.3.mdl exp/nnet4a/137.4.mdl exp/nnet4a/137.5.mdl exp/nnet4a/137.6.mdl exp/nnet4a/137.7.mdl exp/nnet4a/137.8.mdl - | nnet-am-copy --learning-rates=0.00587538268485747:0.00293769134242874:0.00293769134242874 - exp/nnet4a/137.mdl 
EOF
) >exp/nnet4a/log/average.136.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/137.1.mdl exp/nnet4a/137.2.mdl exp/nnet4a/137.3.mdl exp/nnet4a/137.4.mdl exp/nnet4a/137.5.mdl exp/nnet4a/137.6.mdl exp/nnet4a/137.7.mdl exp/nnet4a/137.8.mdl - | nnet-am-copy --learning-rates=0.00587538268485747:0.00293769134242874:0.00293769134242874 - exp/nnet4a/137.mdl  ) 2>>exp/nnet4a/log/average.136.log >>exp/nnet4a/log/average.136.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.136.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.136.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.7791
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.136.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.136.sh >>exp/nnet4a/q/average.136.log 2>&1
