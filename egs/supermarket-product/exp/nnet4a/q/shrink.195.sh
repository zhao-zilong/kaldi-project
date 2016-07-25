#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-subset-egs --n=2000 --randomize-order=true --srand=195 ark:exp/nnet4a/egs/train_diagnostic.egs ark:- | nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=250 exp/nnet4a/196.mdl ark:- exp/nnet4a/196.mdl 
EOF
) >exp/nnet4a/log/shrink.195.log
time1=`date +"%s"`
 ( nnet-subset-egs --n=2000 --randomize-order=true --srand=195 ark:exp/nnet4a/egs/train_diagnostic.egs ark:- | nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=250 exp/nnet4a/196.mdl ark:- exp/nnet4a/196.mdl  ) 2>>exp/nnet4a/log/shrink.195.log >>exp/nnet4a/log/shrink.195.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/shrink.195.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/shrink.195.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.6233
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/shrink.195.log -l mem_free=10G,ram_free=2G,arch=*64  -pe smp 4 -l mem_free=1G,ram_free=1G   /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/shrink.195.sh >>exp/nnet4a/q/shrink.195.log 2>&1
