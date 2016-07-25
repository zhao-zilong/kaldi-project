#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-average exp/nnet4a/175.1.mdl exp/nnet4a/175.2.mdl exp/nnet4a/175.3.mdl exp/nnet4a/175.4.mdl exp/nnet4a/175.5.mdl exp/nnet4a/175.6.mdl exp/nnet4a/175.7.mdl exp/nnet4a/175.8.mdl - | nnet-am-copy --learning-rates=0.00418288403771457:0.00209144201885728:0.00209144201885728 - exp/nnet4a/175.mdl 
EOF
) >exp/nnet4a/log/average.174.log
time1=`date +"%s"`
 ( nnet-am-average exp/nnet4a/175.1.mdl exp/nnet4a/175.2.mdl exp/nnet4a/175.3.mdl exp/nnet4a/175.4.mdl exp/nnet4a/175.5.mdl exp/nnet4a/175.6.mdl exp/nnet4a/175.7.mdl exp/nnet4a/175.8.mdl - | nnet-am-copy --learning-rates=0.00418288403771457:0.00209144201885728:0.00209144201885728 - exp/nnet4a/175.mdl  ) 2>>exp/nnet4a/log/average.174.log >>exp/nnet4a/log/average.174.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/average.174.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/average.174.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.32761
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/average.174.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/average.174.sh >>exp/nnet4a/q/average.174.log 2>&1
