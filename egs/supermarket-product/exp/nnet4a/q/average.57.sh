#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/58.1.mdl exp/nnet4a/58.2.mdl exp/nnet4a/58.3.mdl exp/nnet4a/58.4.mdl exp/nnet4a/58.5.mdl exp/nnet4a/58.6.mdl exp/nnet4a/58.7.mdl exp/nnet4a/58.8.mdl - | nnet-am-copy --learning-rates=0.0119071089544511:0.00595355447722555:0.00595355447722555 - exp/nnet4a/58.mdl 
EOF
) >exp/nnet4a/log/average.57.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/58.1.mdl exp/nnet4a/58.2.mdl exp/nnet4a/58.3.mdl exp/nnet4a/58.4.mdl exp/nnet4a/58.5.mdl exp/nnet4a/58.6.mdl exp/nnet4a/58.7.mdl exp/nnet4a/58.8.mdl - | nnet-am-copy --learning-rates=0.0119071089544511:0.00595355447722555:0.00595355447722555 - exp/nnet4a/58.mdl  ) 2>>exp/nnet4a/log/average.57.log >>exp/nnet4a/log/average.57.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.57.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.57.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.15887
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.57.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.57.sh >>exp/nnet4a/q/average.57.log 2>&1
