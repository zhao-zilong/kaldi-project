#!/bin/bash
cd /home/nlpserver/zzilong/kaldi/egs/supermarket-product
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
nnet-am-init exp/tri3c_ali/tree data/lang/topo "nnet-init exp/nnet4a/nnet.config -|" exp/nnet4a/0.mdl 
EOF
) >exp/nnet4a/log/nnet_init.log
time1=`date +"%s"`
 ( nnet-am-init exp/tri3c_ali/tree data/lang/topo "nnet-init exp/nnet4a/nnet.config -|" exp/nnet4a/0.mdl  ) 2>>exp/nnet4a/log/nnet_init.log >>exp/nnet4a/log/nnet_init.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>exp/nnet4a/log/nnet_init.log
echo '#' Finished at `date` with status $ret >>exp/nnet4a/log/nnet_init.log
[ $ret -eq 137 ] && exit 100;
touch exp/nnet4a/q/done.29855
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o exp/nnet4a/q/nnet_init.log -l mem_free=10G,ram_free=2G,arch=*64    /home/nlpserver/zzilong/kaldi/egs/supermarket-product/exp/nnet4a/q/nnet_init.sh >>exp/nnet4a/q/nnet_init.log 2>&1
