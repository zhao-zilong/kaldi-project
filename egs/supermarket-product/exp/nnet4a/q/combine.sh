#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=512 exp/nnet4a/251.mdl exp/nnet4a/252.mdl exp/nnet4a/253.mdl exp/nnet4a/254.mdl exp/nnet4a/255.mdl exp/nnet4a/256.mdl exp/nnet4a/257.mdl exp/nnet4a/258.mdl exp/nnet4a/259.mdl exp/nnet4a/260.mdl exp/nnet4a/261.mdl exp/nnet4a/262.mdl exp/nnet4a/263.mdl exp/nnet4a/264.mdl exp/nnet4a/265.mdl exp/nnet4a/266.mdl exp/nnet4a/267.mdl exp/nnet4a/268.mdl exp/nnet4a/269.mdl exp/nnet4a/270.mdl ark:exp/nnet4a/egs/combine.egs exp/nnet4a/final.mdl 
EOF
) >exp/nnet4a/log/combine.log
time1=`date +"%s"`
 ( nnet-combine-fast --use-gpu=no --num-threads=8 --verbose=3 --minibatch-size=512 exp/nnet4a/251.mdl exp/nnet4a/252.mdl exp/nnet4a/253.mdl exp/nnet4a/254.mdl exp/nnet4a/255.mdl exp/nnet4a/256.mdl exp/nnet4a/257.mdl exp/nnet4a/258.mdl exp/nnet4a/259.mdl exp/nnet4a/260.mdl exp/nnet4a/261.mdl exp/nnet4a/262.mdl exp/nnet4a/263.mdl exp/nnet4a/264.mdl exp/nnet4a/265.mdl exp/nnet4a/266.mdl exp/nnet4a/267.mdl exp/nnet4a/268.mdl exp/nnet4a/269.mdl exp/nnet4a/270.mdl ark:exp/nnet4a/egs/combine.egs exp/nnet4a/final.mdl  ) 2>>exp/nnet4a/log/combine.log >>exp/nnet4a/log/combine.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/combine.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/combine.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.25490
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/combine.log -l mem_free=10G,ram_free=2G,arch=*64 -l mem_free=1G,ram_free=1G -pe smp 4    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/combine.sh >>exp/nnet4a/q/combine.log 2>&1
