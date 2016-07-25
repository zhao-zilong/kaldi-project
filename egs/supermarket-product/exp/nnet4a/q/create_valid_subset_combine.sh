#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-subset-egs --n=0 ark:exp/nnet4a/egs/valid_all.egs ark:exp/nnet4a/egs/valid_combine.egs 
EOF
) >exp/nnet4a/log/create_valid_subset_combine.log
time1=`date +"%s"`
 ( nnet-subset-egs --n=0 ark:exp/nnet4a/egs/valid_all.egs ark:exp/nnet4a/egs/valid_combine.egs  ) 2>>exp/nnet4a/log/create_valid_subset_combine.log >>exp/nnet4a/log/create_valid_subset_combine.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/create_valid_subset_combine.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/create_valid_subset_combine.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.28474
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/create_valid_subset_combine.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/create_valid_subset_combine.sh >>exp/nnet4a/q/create_valid_subset_combine.log 2>&1
