#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-subset-egs --n=2000 --randomize-order=true --srand=60 ark:exp/nnet4a/egs/train_diagnostic.egs ark:- | nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=250 exp/nnet4a/61.mdl ark:- exp/nnet4a/61.mdl 
EOF
) >exp/nnet4a/log/shrink.60.log
time1=`date +"%s"`
 ( nnet-subset-egs --n=2000 --randomize-order=true --srand=60 ark:exp/nnet4a/egs/train_diagnostic.egs ark:- | nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=250 exp/nnet4a/61.mdl ark:- exp/nnet4a/61.mdl  ) 2>>exp/nnet4a/log/shrink.60.log >>exp/nnet4a/log/shrink.60.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/shrink.60.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/shrink.60.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.17248
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/shrink.60.log -l mem_free=10G,ram_free=2G,arch=*64  -l mem_free=1G,ram_free=1G -pe smp 4   /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/shrink.60.sh >>exp/nnet4a/q/shrink.60.log 2>&1
