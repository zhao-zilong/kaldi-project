#!/bin/bash

. ./path.sh || exit 1
. ./cmd.sh || exit 1

nj=1
nt=11


## Do LDA+MLLT+SAT, and decode.
#steps/train_sat.sh 1800 9000 data/train data/lang exp/tri2b_ali exp/tri3b
#utils/mkgraph.sh data/lang exp/tri3b exp/tri3b/graph
#steps/decode_fmllr.sh --config conf/decode.config --nj $nj --cmd "$decode_cmd" \
#  exp/tri3b/graph data/test exp/tri3b/decode



# Align all data with LDA+MLLT+SAT system (tri3b)
steps/align_fmllr.sh --nj $nt --cmd "$train_cmd"  \
  data/train data/lang exp/tri3b exp/tri3b_ali

