#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
ali-to-phones --per-frame=true exp/nnet4a/decode/../final.mdl "ark:gunzip -c exp/nnet4a/decode/ali_tmp.${SGE_TASK_ID}.gz|" ark,t:- | paste /dev/stdin <( gunzip -c exp/nnet4a/decode/depth_tmp.${SGE_TASK_ID}.gz ) | awk '{ half=NF/2; for (n=2; n<=half; n++) { m=n+half; count[$n " " $m]++;}} END{for(k in count) print k, count[k]; }' | gzip -c > exp/nnet4a/decode/depth_stats_tmp.${SGE_TASK_ID}.gz 
EOF
) >exp/nnet4a/decode/log/lattice_best_path.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( ali-to-phones --per-frame=true exp/nnet4a/decode/../final.mdl "ark:gunzip -c exp/nnet4a/decode/ali_tmp.${SGE_TASK_ID}.gz|" ark,t:- | paste /dev/stdin <( gunzip -c exp/nnet4a/decode/depth_tmp.${SGE_TASK_ID}.gz ) | awk '{ half=NF/2; for (n=2; n<=half; n++) { m=n+half; count[$n " " $m]++;}} END{for(k in count) print k, count[k]; }' | gzip -c > exp/nnet4a/decode/depth_stats_tmp.${SGE_TASK_ID}.gz  ) 2>>exp/nnet4a/decode/log/lattice_best_path.$SGE_TASK_ID.log >>exp/nnet4a/decode/log/lattice_best_path.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/log/lattice_best_path.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/log/lattice_best_path.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/q/done.25930.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/q/lattice_best_path.log -l mem_free=10G,ram_free=2G,arch=*64   -t 1:1 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/q/lattice_best_path.sh >>exp/nnet4a/decode/q/lattice_best_path.log 2>&1
