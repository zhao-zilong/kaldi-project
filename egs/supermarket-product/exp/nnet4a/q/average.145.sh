#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/146.1.mdl exp/nnet4a/146.2.mdl exp/nnet4a/146.3.mdl exp/nnet4a/146.4.mdl exp/nnet4a/146.5.mdl exp/nnet4a/146.6.mdl exp/nnet4a/146.7.mdl exp/nnet4a/146.8.mdl - | nnet-am-copy --learning-rates=0.00542110299920339:0.00271055149960169:0.00271055149960169 - exp/nnet4a/146.mdl 
EOF
) >exp/nnet4a/log/average.145.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/146.1.mdl exp/nnet4a/146.2.mdl exp/nnet4a/146.3.mdl exp/nnet4a/146.4.mdl exp/nnet4a/146.5.mdl exp/nnet4a/146.6.mdl exp/nnet4a/146.7.mdl exp/nnet4a/146.8.mdl - | nnet-am-copy --learning-rates=0.00542110299920339:0.00271055149960169:0.00271055149960169 - exp/nnet4a/146.mdl  ) 2>>exp/nnet4a/log/average.145.log >>exp/nnet4a/log/average.145.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.145.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.145.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.10199
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.145.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.145.sh >>exp/nnet4a/q/average.145.log 2>&1
