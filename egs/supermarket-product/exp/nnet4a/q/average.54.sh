#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/55.1.mdl exp/nnet4a/55.2.mdl exp/nnet4a/55.3.mdl exp/nnet4a/55.4.mdl exp/nnet4a/55.5.mdl exp/nnet4a/55.6.mdl exp/nnet4a/55.7.mdl exp/nnet4a/55.8.mdl - | nnet-am-copy --learning-rates=0.0122308271231649:0.00611541356158245:0.00611541356158245 - exp/nnet4a/55.mdl 
EOF
) >exp/nnet4a/log/average.54.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/55.1.mdl exp/nnet4a/55.2.mdl exp/nnet4a/55.3.mdl exp/nnet4a/55.4.mdl exp/nnet4a/55.5.mdl exp/nnet4a/55.6.mdl exp/nnet4a/55.7.mdl exp/nnet4a/55.8.mdl - | nnet-am-copy --learning-rates=0.0122308271231649:0.00611541356158245:0.00611541356158245 - exp/nnet4a/55.mdl  ) 2>>exp/nnet4a/log/average.54.log >>exp/nnet4a/log/average.54.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.54.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.54.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.14572
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.54.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.54.sh >>exp/nnet4a/q/average.54.log 2>&1
