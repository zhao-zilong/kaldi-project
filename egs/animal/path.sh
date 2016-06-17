# Defining Kaldi root directory
export KALDI_ROOT=`pwd`/../..
. $KALDI_ROOT/tools/config/common_path.sh
# Setting paths to useful tools
export PATH=/usr/local/cuda-7.5/bin:$PWD/utils/:$KALDI_ROOT/src/bin:$KALDI_ROOT/src/lmbin:$KALDI_ROOT/tools/openfst/bin:$KALDI_ROOT/tools/env.sh:$KALDI_ROOT/src/fstbin/:$KALDI_ROOT/src/gmmbin/:$KALDI_ROOT/src/featbin/:$KALDI_ROOT/src/lm/:$KALDI_ROOT/src/sgmmbin/:$KALDI_ROOT/src/sgmm2bin/:$KALDI_ROOT/src/fgmmbin/:$KALDI_ROOT/src/latbin/:$PWD:$PATH

# Defining audio data directory (modify it for your installation directory!)
export DATA_ROOT="/home/nlpserver/zzilong/kaldi/egs/animal/audio"

# Variable that stores path to MITLM library
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$KALDI_ROOT/tools/mitlm-svn/lib

#for CUDA	
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64
# Variable needed for proper data sorting
export LC_ALL=C

# import srilm

source $KALDI_ROOT/tools/env.sh
