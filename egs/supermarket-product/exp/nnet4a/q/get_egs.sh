#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-get-egs --left-context=5 --right-context=5 "ark,s,cs:utils/filter_scp.pl --exclude exp/nnet4a/valid_uttlist data/train/split20/${SGE_TASK_ID}/feats.scp | apply-cmvn  --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk scp:data/train/split20/${SGE_TASK_ID}/cmvn.scp scp:- ark:- | transform-feats --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk ark:exp/tri3c_ali/raw_trans.${SGE_TASK_ID} ark:- ark:- |" "ark,s,cs:gunzip -c exp/tri3c_ali/ali.${SGE_TASK_ID}.gz | ali-to-pdf exp/tri3c_ali/final.mdl ark:- ark:- | ali-to-post ark:- ark:- |" ark:- | nnet-copy-egs ark:- ark:exp/nnet4a/egs/egs_orig.1.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.2.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.3.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.4.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.5.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.6.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.7.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.8.${SGE_TASK_ID}.ark 
EOF
) >exp/nnet4a/log/get_egs.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( nnet-get-egs --left-context=5 --right-context=5 "ark,s,cs:utils/filter_scp.pl --exclude exp/nnet4a/valid_uttlist data/train/split20/${SGE_TASK_ID}/feats.scp | apply-cmvn  --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk scp:data/train/split20/${SGE_TASK_ID}/cmvn.scp scp:- ark:- | transform-feats --utt2spk=ark:data/train/split20/${SGE_TASK_ID}/utt2spk ark:exp/tri3c_ali/raw_trans.${SGE_TASK_ID} ark:- ark:- |" "ark,s,cs:gunzip -c exp/tri3c_ali/ali.${SGE_TASK_ID}.gz | ali-to-pdf exp/tri3c_ali/final.mdl ark:- ark:- | ali-to-post ark:- ark:- |" ark:- | nnet-copy-egs ark:- ark:exp/nnet4a/egs/egs_orig.1.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.2.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.3.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.4.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.5.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.6.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.7.${SGE_TASK_ID}.ark ark:exp/nnet4a/egs/egs_orig.8.${SGE_TASK_ID}.ark  ) 2>>exp/nnet4a/log/get_egs.$SGE_TASK_ID.log >>exp/nnet4a/log/get_egs.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/get_egs.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/get_egs.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.28552.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/get_egs.log -l mem_free=10G,ram_free=2G,arch=*64 -tc 5   -t 1:20 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/get_egs.sh >>exp/nnet4a/q/get_egs.log 2>&1
