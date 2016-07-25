#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/113.1.mdl exp/nnet4a/113.2.mdl exp/nnet4a/113.3.mdl exp/nnet4a/113.4.mdl exp/nnet4a/113.5.mdl exp/nnet4a/113.6.mdl exp/nnet4a/113.7.mdl exp/nnet4a/113.8.mdl - | nnet-am-copy --learning-rates=0.00728168955792899:0.0036408447789645:0.0036408447789645 - exp/nnet4a/113.mdl 
EOF
) >exp/nnet4a/log/average.112.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/113.1.mdl exp/nnet4a/113.2.mdl exp/nnet4a/113.3.mdl exp/nnet4a/113.4.mdl exp/nnet4a/113.5.mdl exp/nnet4a/113.6.mdl exp/nnet4a/113.7.mdl exp/nnet4a/113.8.mdl - | nnet-am-copy --learning-rates=0.00728168955792899:0.0036408447789645:0.0036408447789645 - exp/nnet4a/113.mdl  ) 2>>exp/nnet4a/log/average.112.log >>exp/nnet4a/log/average.112.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.112.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.112.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.1038
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.112.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.112.sh >>exp/nnet4a/q/average.112.log 2>&1
