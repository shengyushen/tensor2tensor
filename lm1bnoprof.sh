#!/bin/bash
if [ $# -ne 3 ] ; 
  then echo "Usage : lm1b.sh <batch size> <expert number> <gpu number>"
else 
  rm -rf bs$1_moe$2_gpu$3.out
  rm -f bs$1_moe$2_gpu$3.*
  mkdir bs$1_moe$2_gpu$3.out
    /usr/local/bin/t2t-trainer \
    --generate_data \
    --model=transformer_moe \
    --hparams_set=transformer_moe_2k \
    --hparams="batch_size=$1,moe_num_experts=$2" \
    --problem=languagemodel_lm1b8k_packed \
    --train_steps=200 \
    --local_eval_frequency=200 \
    --eval_steps=3 \
    --worker_gpu=$3 \
    --worker_gpu_memory_fraction=0.80 \
    --keep_checkpoint_max=0 \
    --data_dir=../moe_data/data \
    --output_dir=bs$1_moe$2_gpu$3.out \
    --tmp_dir=/tmp 2> >(tee bs$1_moe$2_gpu$3.log)
fi


#    --metrics flop_count_dp,flop_count_sp,flop_dp_efficiency,flop_sp_efficiency,flop_count_hp,flop_hp_efficiency \
#    --metrics flop_count_dp,flop_count_sp,flop_dp_efficiency,flop_sp_efficiency,flop_count_hp,flop_hp_efficiency,dram_read_bytes,dram_read_throughput,dram_read_transactions,dram_utilization,dram_write_bytes,dram_write_throughput,dram_write_transactions,gld_efficiency,gld_requested_throughput,gld_throughput,gld_transactions,gld_transactions_per_request,global_load_requests,global_store_requests,gst_efficiency,gst_requested_throughput,gst_throughput,gst_transactions,gst_transactions_per_request,global_reduction_requests\
# too much metrics that hand the t2t

#--print-api-trae\
#--unified-memory-profiling per-process-device  \
#--profile-api-trace none 
# this disable dependency analysis

#    --local_eval_frequency=200 \
# this is the steps in each iteration
#    --train_steps=400 \
# total steps



################### THESE are not used
# --train_steps_per_iteration=200 \
# this is not used
#    --iterations_per_loop=200 \
#this is not used
#    export CUDA_VISIBLE_DEVICES="2,3"
#    --locally_shard_to_cpu=True \
#  this may cause exit of training
