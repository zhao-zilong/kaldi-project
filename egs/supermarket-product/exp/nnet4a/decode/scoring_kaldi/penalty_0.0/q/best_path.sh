#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
lattice-scale --inv-acoustic-scale=${SGE_TASK_ID} "ark:gunzip -c exp/nnet4a/decode/lat.*.gz|" ark:- | lattice-add-penalty --word-ins-penalty=0.0 ark:- ark:- | lattice-best-path --word-symbol-table=exp/tri3c/graph/words.txt ark:- ark,t:- | utils/int2sym.pl -f 2- exp/tri3c/graph/words.txt | cat > exp/nnet4a/decode/scoring_kaldi/penalty_0.0/${SGE_TASK_ID}.txt 
EOF
) >exp/nnet4a/decode/scoring_kaldi/penalty_0.0/log/best_path.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( lattice-scale --inv-acoustic-scale=${SGE_TASK_ID} "ark:gunzip -c exp/nnet4a/decode/lat.*.gz|" ark:- | lattice-add-penalty --word-ins-penalty=0.0 ark:- ark:- | lattice-best-path --word-symbol-table=exp/tri3c/graph/words.txt ark:- ark,t:- | utils/int2sym.pl -f 2- exp/tri3c/graph/words.txt | cat > exp/nnet4a/decode/scoring_kaldi/penalty_0.0/${SGE_TASK_ID}.txt  ) 2>>exp/nnet4a/decode/scoring_kaldi/penalty_0.0/log/best_path.$SGE_TASK_ID.log >>exp/nnet4a/decode/scoring_kaldi/penalty_0.0/log/best_path.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/scoring_kaldi/penalty_0.0/log/best_path.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/scoring_kaldi/penalty_0.0/log/best_path.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/scoring_kaldi/penalty_0.0/q/done.26027.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/scoring_kaldi/penalty_0.0/q/best_path.log -l mem_free=10G,ram_free=2G,arch=*64   -t 9:20 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/scoring_kaldi/penalty_0.0/q/best_path.sh >>exp/nnet4a/decode/scoring_kaldi/penalty_0.0/q/best_path.log 2>&1
