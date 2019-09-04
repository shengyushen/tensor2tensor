#!/bin/bash
for fn in bs*_moe*_gpu*.csv; do
    echo $fn
    echo $fn | ./extractBsMoeGpu.sh
    ./seperate.sh $fn
    grep PtoP $fn |./extractPtoP.sh | ./extractTotalFlow.sh |grep ^2 |awk '{ssy=ssy+$NF} END{print ssy}'
done

