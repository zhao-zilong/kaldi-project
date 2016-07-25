#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-get-egs --left-context=5 --right-context=5 "ark,s,cs:utils/filter_scp.pl exp/nnet4a/valid_uttlist data/train/feats.scp | apply-cmvn  --utt2spk=ark:data/train/utt2spk scp:data/train/cmvn.scp scp:- ark:- | transform-feats --utt2spk=ark:data/train/utt2spk 'ark:cat exp/tri3c_ali/raw_trans.*|' ark:- ark:- |" "ark,s,cs:gunzip -c exp/nnet4a/ali_special.gz | ali-to-pdf exp/tri3c_ali/final.mdl ark:- ark:- | ali-to-post ark:- ark:- |" ark:exp/nnet4a/egs/valid_all.egs 
EOF
) >exp/nnet4a/log/create_valid_subset.log
time1=`date +"%s"`
 ( nnet-get-egs --left-context=5 --right-context=5 "ark,s,cs:utils/filter_scp.pl exp/nnet4a/valid_uttlist data/train/feats.scp | apply-cmvn  --utt2spk=ark:data/train/utt2spk scp:data/train/cmvn.scp scp:- ark:- | transform-feats --utt2spk=ark:data/train/utt2spk 'ark:cat exp/tri3c_ali/raw_trans.*|' ark:- ark:- |" "ark,s,cs:gunzip -c exp/nnet4a/ali_special.gz | ali-to-pdf exp/tri3c_ali/final.mdl ark:- ark:- | ali-to-post ark:- ark:- |" ark:exp/nnet4a/egs/valid_all.egs  ) 2>>exp/nnet4a/log/create_valid_subset.log >>exp/nnet4a/log/create_valid_subset.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/create_valid_subset.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/create_valid_subset.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.28407
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/create_valid_subset.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/create_valid_subset.sh >>exp/nnet4a/q/create_valid_subset.log 2>&1
