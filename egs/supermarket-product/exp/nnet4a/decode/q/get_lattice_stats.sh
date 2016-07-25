#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
ali-to-phones --write-lengths=true exp/nnet4a/decode/../final.mdl "ark:gunzip -c exp/nnet4a/decode/ali_tmp.${SGE_TASK_ID}.gz|" ark,t:- | sed -E "s/^[^ ]+ //" | awk 'BEGIN{FS=" ; "; OFS="\n";} {print "begin " $1; print "end " $NF; for (n=1;n<=NF;n++) print "all " $n; }' | sort | uniq -c | gzip -c > exp/nnet4a/decode/phone_stats.${SGE_TASK_ID}.gz 
EOF
) >exp/nnet4a/decode/log/get_lattice_stats.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( ali-to-phones --write-lengths=true exp/nnet4a/decode/../final.mdl "ark:gunzip -c exp/nnet4a/decode/ali_tmp.${SGE_TASK_ID}.gz|" ark,t:- | sed -E "s/^[^ ]+ //" | awk 'BEGIN{FS=" ; "; OFS="\n";} {print "begin " $1; print "end " $NF; for (n=1;n<=NF;n++) print "all " $n; }' | sort | uniq -c | gzip -c > exp/nnet4a/decode/phone_stats.${SGE_TASK_ID}.gz  ) 2>>exp/nnet4a/decode/log/get_lattice_stats.$SGE_TASK_ID.log >>exp/nnet4a/decode/log/get_lattice_stats.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/log/get_lattice_stats.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/log/get_lattice_stats.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/q/done.25851.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/q/get_lattice_stats.log -l mem_free=10G,ram_free=2G,arch=*64   -t 1:1 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/q/get_lattice_stats.sh >>exp/nnet4a/decode/q/get_lattice_stats.log 2>&1
