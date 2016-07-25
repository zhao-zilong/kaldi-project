#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/105.1.mdl exp/nnet4a/105.2.mdl exp/nnet4a/105.3.mdl exp/nnet4a/105.4.mdl exp/nnet4a/105.5.mdl exp/nnet4a/105.6.mdl exp/nnet4a/105.7.mdl exp/nnet4a/105.8.mdl - | nnet-am-copy --learning-rates=0.00782163405603576:0.00391081702801788:0.00391081702801788 - exp/nnet4a/105.mdl 
EOF
) >exp/nnet4a/log/average.104.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/105.1.mdl exp/nnet4a/105.2.mdl exp/nnet4a/105.3.mdl exp/nnet4a/105.4.mdl exp/nnet4a/105.5.mdl exp/nnet4a/105.6.mdl exp/nnet4a/105.7.mdl exp/nnet4a/105.8.mdl - | nnet-am-copy --learning-rates=0.00782163405603576:0.00391081702801788:0.00391081702801788 - exp/nnet4a/105.mdl  ) 2>>exp/nnet4a/log/average.104.log >>exp/nnet4a/log/average.104.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.104.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.104.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.31077
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.104.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.104.sh >>exp/nnet4a/q/average.104.log 2>&1
