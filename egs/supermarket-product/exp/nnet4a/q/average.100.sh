#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/101.1.mdl exp/nnet4a/101.2.mdl exp/nnet4a/101.3.mdl exp/nnet4a/101.4.mdl exp/nnet4a/101.5.mdl exp/nnet4a/101.6.mdl exp/nnet4a/101.7.mdl exp/nnet4a/101.8.mdl - | nnet-am-copy --learning-rates=0.00810643976273349:0.00405321988136674:0.00405321988136674 - exp/nnet4a/101.mdl 
EOF
) >exp/nnet4a/log/average.100.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/101.1.mdl exp/nnet4a/101.2.mdl exp/nnet4a/101.3.mdl exp/nnet4a/101.4.mdl exp/nnet4a/101.5.mdl exp/nnet4a/101.6.mdl exp/nnet4a/101.7.mdl exp/nnet4a/101.8.mdl - | nnet-am-copy --learning-rates=0.00810643976273349:0.00405321988136674:0.00405321988136674 - exp/nnet4a/101.mdl  ) 2>>exp/nnet4a/log/average.100.log >>exp/nnet4a/log/average.100.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.100.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.100.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.29762
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.100.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.100.sh >>exp/nnet4a/q/average.100.log 2>&1
