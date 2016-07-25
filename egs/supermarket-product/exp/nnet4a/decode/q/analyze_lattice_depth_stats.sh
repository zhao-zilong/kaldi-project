#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
gunzip -c exp/nnet4a/decode/depth_stats_tmp.*.gz | steps/diagnostic/analyze_lattice_depth_stats.py exp/tri3c/graph 
EOF
) >exp/nnet4a/decode/log/analyze_lattice_depth_stats.log
time1=`date +"%s"`
 ( gunzip -c exp/nnet4a/decode/depth_stats_tmp.*.gz | steps/diagnostic/analyze_lattice_depth_stats.py exp/tri3c/graph  ) 2>>exp/nnet4a/decode/log/analyze_lattice_depth_stats.log >>exp/nnet4a/decode/log/analyze_lattice_depth_stats.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/log/analyze_lattice_depth_stats.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/log/analyze_lattice_depth_stats.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/q/done.25969
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/q/analyze_lattice_depth_stats.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/q/analyze_lattice_depth_stats.sh >>exp/nnet4a/decode/q/analyze_lattice_depth_stats.log 2>&1
