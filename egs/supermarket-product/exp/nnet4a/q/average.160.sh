#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/161.1.mdl exp/nnet4a/161.2.mdl exp/nnet4a/161.3.mdl exp/nnet4a/161.4.mdl exp/nnet4a/161.5.mdl exp/nnet4a/161.6.mdl exp/nnet4a/161.7.mdl exp/nnet4a/161.8.mdl - | nnet-am-copy --learning-rates=0.00474067473199736:0.00237033736599868:0.00237033736599868 - exp/nnet4a/161.mdl 
EOF
) >exp/nnet4a/log/average.160.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/161.1.mdl exp/nnet4a/161.2.mdl exp/nnet4a/161.3.mdl exp/nnet4a/161.4.mdl exp/nnet4a/161.5.mdl exp/nnet4a/161.6.mdl exp/nnet4a/161.7.mdl exp/nnet4a/161.8.mdl - | nnet-am-copy --learning-rates=0.00474067473199736:0.00237033736599868:0.00237033736599868 - exp/nnet4a/161.mdl  ) 2>>exp/nnet4a/log/average.160.log >>exp/nnet4a/log/average.160.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.160.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.160.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.29022
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.160.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.160.sh >>exp/nnet4a/q/average.160.log 2>&1
