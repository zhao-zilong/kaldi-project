#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/151.1.mdl exp/nnet4a/151.2.mdl exp/nnet4a/151.3.mdl exp/nnet4a/151.4.mdl exp/nnet4a/151.5.mdl exp/nnet4a/151.6.mdl exp/nnet4a/151.7.mdl exp/nnet4a/151.8.mdl - | nnet-am-copy --learning-rates=0.00518408155743696:0.00259204077871848:0.00259204077871848 - exp/nnet4a/151.mdl 
EOF
) >exp/nnet4a/log/average.150.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/151.1.mdl exp/nnet4a/151.2.mdl exp/nnet4a/151.3.mdl exp/nnet4a/151.4.mdl exp/nnet4a/151.5.mdl exp/nnet4a/151.6.mdl exp/nnet4a/151.7.mdl exp/nnet4a/151.8.mdl - | nnet-am-copy --learning-rates=0.00518408155743696:0.00259204077871848:0.00259204077871848 - exp/nnet4a/151.mdl  ) 2>>exp/nnet4a/log/average.150.log >>exp/nnet4a/log/average.150.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.150.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.150.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.11621
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.150.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.150.sh >>exp/nnet4a/q/average.150.log 2>&1
