#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/155.1.mdl exp/nnet4a/155.2.mdl exp/nnet4a/155.3.mdl exp/nnet4a/155.4.mdl exp/nnet4a/155.5.mdl exp/nnet4a/155.6.mdl exp/nnet4a/155.7.mdl exp/nnet4a/155.8.mdl - | nnet-am-copy --learning-rates=0.00500194783970652:0.00250097391985326:0.00250097391985326 - exp/nnet4a/155.mdl 
EOF
) >exp/nnet4a/log/average.154.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/155.1.mdl exp/nnet4a/155.2.mdl exp/nnet4a/155.3.mdl exp/nnet4a/155.4.mdl exp/nnet4a/155.5.mdl exp/nnet4a/155.6.mdl exp/nnet4a/155.7.mdl exp/nnet4a/155.8.mdl - | nnet-am-copy --learning-rates=0.00500194783970652:0.00250097391985326:0.00250097391985326 - exp/nnet4a/155.mdl  ) 2>>exp/nnet4a/log/average.154.log >>exp/nnet4a/log/average.154.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.154.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.154.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.27348
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.154.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.154.sh >>exp/nnet4a/q/average.154.log 2>&1
