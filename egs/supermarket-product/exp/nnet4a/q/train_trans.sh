#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-train-transitions exp/nnet4a/0.mdl "ark:gunzip -c exp/tri3c_ali/ali.*.gz|" exp/nnet4a/0.mdl 
EOF
) >exp/nnet4a/log/train_trans.log
time1=`date +"%s"`
 ( nnet-train-transitions exp/nnet4a/0.mdl "ark:gunzip -c exp/tri3c_ali/ali.*.gz|" exp/nnet4a/0.mdl  ) 2>>exp/nnet4a/log/train_trans.log >>exp/nnet4a/log/train_trans.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/train_trans.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/train_trans.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.29874
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/train_trans.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/train_trans.sh >>exp/nnet4a/q/train_trans.log 2>&1
