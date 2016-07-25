#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/76.1.mdl exp/nnet4a/76.2.mdl exp/nnet4a/76.3.mdl exp/nnet4a/76.4.mdl exp/nnet4a/76.5.mdl exp/nnet4a/76.6.mdl exp/nnet4a/76.7.mdl exp/nnet4a/76.8.mdl - | nnet-am-copy --learning-rates=0.0101369972147289:0.00506849860736445:0.00506849860736445 - exp/nnet4a/76.mdl 
EOF
) >exp/nnet4a/log/average.75.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/76.1.mdl exp/nnet4a/76.2.mdl exp/nnet4a/76.3.mdl exp/nnet4a/76.4.mdl exp/nnet4a/76.5.mdl exp/nnet4a/76.6.mdl exp/nnet4a/76.7.mdl exp/nnet4a/76.8.mdl - | nnet-am-copy --learning-rates=0.0101369972147289:0.00506849860736445:0.00506849860736445 - exp/nnet4a/76.mdl  ) 2>>exp/nnet4a/log/average.75.log >>exp/nnet4a/log/average.75.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.75.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.75.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.22341
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.75.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.75.sh >>exp/nnet4a/q/average.75.log 2>&1
