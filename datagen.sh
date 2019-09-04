#PROBLEM=translate_ende_wmt32k
#PROBLEM=languagemodel_lm1b8k_packed
PROBLEM=languagemodel_ptb10k
MODEL=transformer_moe
HPARAMS=transformer_base_single_gpu

DATA_DIR=$HOME/ssy/t2t_data
TMP_DIR=/tmp/t2t_datagen
TRAIN_DIR=$HOME/ssy/t2t_train/$PROBLEM/$MODEL-$HPARAMS

mkdir -p $DATA_DIR $TMP_DIR $TRAIN_DIR

# Generate data
t2t-datagen \
  --data_dir=$DATA_DIR \
  --tmp_dir=$TMP_DIR \
  --problem=$PROBLEM




