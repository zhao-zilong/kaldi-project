#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-adjust-priors exp/nnet4a/final.mdl exp/nnet4a/post.vec exp/nnet4a/final.mdl 
EOF
) >exp/nnet4a/log/adjust_priors.log
time1=`date +"%s"`
 ( nnet-adjust-priors exp/nnet4a/final.mdl exp/nnet4a/post.vec exp/nnet4a/final.mdl  ) 2>>exp/nnet4a/log/adjust_priors.log >>exp/nnet4a/log/adjust_priors.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/adjust_priors.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/adjust_priors.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.25677
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/adjust_priors.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/adjust_priors.sh >>exp/nnet4a/q/adjust_priors.log 2>&1
