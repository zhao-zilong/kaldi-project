#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-subset-egs --n=2000 --randomize-order=true --srand=190 ark:exp/nnet4a/egs/train_diagnostic.egs ark:- | nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=250 exp/nnet4a/191.mdl ark:- exp/nnet4a/191.mdl 
EOF
) >exp/nnet4a/log/shrink.190.log
time1=`date +"%s"`
 ( nnet-subset-egs --n=2000 --randomize-order=true --srand=190 ark:exp/nnet4a/egs/train_diagnostic.egs ark:- | nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=250 exp/nnet4a/191.mdl ark:- exp/nnet4a/191.mdl  ) 2>>exp/nnet4a/log/shrink.190.log >>exp/nnet4a/log/shrink.190.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/shrink.190.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/shrink.190.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.4919
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/shrink.190.log -l mem_free=10G,ram_free=2G,arch=*64 -l mem_free=1G,ram_free=1G  -pe smp 4   /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/shrink.190.sh >>exp/nnet4a/q/shrink.190.log 2>&1
