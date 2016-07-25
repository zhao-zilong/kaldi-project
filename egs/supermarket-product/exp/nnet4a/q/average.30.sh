#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/31.1.mdl exp/nnet4a/31.2.mdl exp/nnet4a/31.3.mdl exp/nnet4a/31.4.mdl exp/nnet4a/31.5.mdl exp/nnet4a/31.6.mdl exp/nnet4a/31.7.mdl exp/nnet4a/31.8.mdl - | nnet-am-copy --learning-rates=0.0151583464302878:0.0075791732151439:0.0075791732151439 - exp/nnet4a/31.mdl 
EOF
) >exp/nnet4a/log/average.30.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/31.1.mdl exp/nnet4a/31.2.mdl exp/nnet4a/31.3.mdl exp/nnet4a/31.4.mdl exp/nnet4a/31.5.mdl exp/nnet4a/31.6.mdl exp/nnet4a/31.7.mdl exp/nnet4a/31.8.mdl - | nnet-am-copy --learning-rates=0.0151583464302878:0.0075791732151439:0.0075791732151439 - exp/nnet4a/31.mdl  ) 2>>exp/nnet4a/log/average.30.log >>exp/nnet4a/log/average.30.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.30.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.30.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.7091
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.30.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.30.sh >>exp/nnet4a/q/average.30.log 2>&1
