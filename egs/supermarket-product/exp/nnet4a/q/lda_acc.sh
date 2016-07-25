#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
ali-to-post "ark:gunzip -c exp/tri3c_ali/ali.${SGE_TASK_ID}.gz|" ark:- | weight-silence-post 0.0 1:2:3:4:5:6:7:8:9:10 exp/tri3c_ali/final.mdl ark:- ark:- | acc-lda --rand-prune=4.0 exp/tri3c_ali/final.mdl "ark,s,cs:utils/subset_scp.pl --quiet 500 data/train/split20/${SGE_TASK_ID}/feats.scp | apply-cmvn  --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk scp:data/train/split20/${SGE_TASK_ID}/cmvn.scp scp:- ark:- | transform-feats --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk ark:exp/tri3c_ali/raw_trans.${SGE_TASK_ID} ark:- ark:- | splice-feats --left-context=5 --right-context=5 ark:- ark:- |" ark,s,cs:- exp/nnet4a/lda.${SGE_TASK_ID}.acc 
EOF
) >exp/nnet4a/log/lda_acc.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( ali-to-post "ark:gunzip -c exp/tri3c_ali/ali.${SGE_TASK_ID}.gz|" ark:- | weight-silence-post 0.0 1:2:3:4:5:6:7:8:9:10 exp/tri3c_ali/final.mdl ark:- ark:- | acc-lda --rand-prune=4.0 exp/tri3c_ali/final.mdl "ark,s,cs:utils/subset_scp.pl --quiet 500 data/train/split20/${SGE_TASK_ID}/feats.scp | apply-cmvn  --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk scp:data/train/split20/${SGE_TASK_ID}/cmvn.scp scp:- ark:- | transform-feats --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk ark:exp/tri3c_ali/raw_trans.${SGE_TASK_ID} ark:- ark:- | splice-feats --left-context=5 --right-context=5 ark:- ark:- |" ark,s,cs:- exp/nnet4a/lda.${SGE_TASK_ID}.acc  ) 2>>exp/nnet4a/log/lda_acc.$SGE_TASK_ID.log >>exp/nnet4a/log/lda_acc.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/lda_acc.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/lda_acc.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.24985.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/lda_acc.log -l mem_free=10G,ram_free=2G,arch=*64   -t 1:20 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/lda_acc.sh >>exp/nnet4a/q/lda_acc.log 2>&1
