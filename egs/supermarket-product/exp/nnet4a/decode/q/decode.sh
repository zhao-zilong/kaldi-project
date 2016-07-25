#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-latgen-faster --minimize=false --max-active=7000 --min-active=200 --beam=13.0 --lattice-beam=6.0 --acoustic-scale=0.1 --allow-partial=true --word-symbol-table=exp/tri3c/graph/words.txt exp/nnet4a/final.mdl exp/tri3c/graph/HCLG.fst "ark,s,cs:apply-cmvn  --utt2spk=ark:data/test/split1/${SGE_TASK_ID}/utt2spk scp:data/test/split1/${SGE_TASK_ID}/cmvn.scp scp:data/test/split1/${SGE_TASK_ID}/feats.scp ark:- | transform-feats --utt2spk=ark:data/test/split1/${SGE_TASK_ID}/utt2spk ark:exp/tri3c/decode/raw_trans.${SGE_TASK_ID} ark:- ark:- |" "ark:|gzip -c > exp/nnet4a/decode/lat.${SGE_TASK_ID}.gz" 
EOF
) >exp/nnet4a/decode/log/decode.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( nnet-latgen-faster --minimize=false --max-active=7000 --min-active=200 --beam=13.0 --lattice-beam=6.0 --acoustic-scale=0.1 --allow-partial=true --word-symbol-table=exp/tri3c/graph/words.txt exp/nnet4a/final.mdl exp/tri3c/graph/HCLG.fst "ark,s,cs:apply-cmvn  --utt2spk=ark:data/test/split1/${SGE_TASK_ID}/utt2spk scp:data/test/split1/${SGE_TASK_ID}/cmvn.scp scp:data/test/split1/${SGE_TASK_ID}/feats.scp ark:- | transform-feats --utt2spk=ark:data/test/split1/${SGE_TASK_ID}/utt2spk ark:exp/tri3c/decode/raw_trans.${SGE_TASK_ID} ark:- ark:- |" "ark:|gzip -c > exp/nnet4a/decode/lat.${SGE_TASK_ID}.gz"  ) 2>>exp/nnet4a/decode/log/decode.$SGE_TASK_ID.log >>exp/nnet4a/decode/log/decode.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/decode/log/decode.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/decode/log/decode.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/decode/q/done.25760.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/decode/q/decode.log -l mem_free=10G,ram_free=2G,arch=*64    -t 1:1 /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/decode/q/decode.sh >>exp/nnet4a/decode/q/decode.log 2>&1
