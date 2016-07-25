#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
vector-sum exp/nnet4a/post.1.vec exp/nnet4a/post.2.vec exp/nnet4a/post.3.vec exp/nnet4a/post.4.vec exp/nnet4a/post.5.vec exp/nnet4a/post.6.vec exp/nnet4a/post.7.vec exp/nnet4a/post.8.vec exp/nnet4a/post.vec 
EOF
) >exp/nnet4a/log/vector_sum.log
time1=`date +"%s"`
 ( vector-sum exp/nnet4a/post.1.vec exp/nnet4a/post.2.vec exp/nnet4a/post.3.vec exp/nnet4a/post.4.vec exp/nnet4a/post.5.vec exp/nnet4a/post.6.vec exp/nnet4a/post.7.vec exp/nnet4a/post.8.vec exp/nnet4a/post.vec  ) 2>>exp/nnet4a/log/vector_sum.log >>exp/nnet4a/log/vector_sum.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/vector_sum.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/vector_sum.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.25649
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/vector_sum.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/vector_sum.sh >>exp/nnet4a/q/vector_sum.log 2>&1
