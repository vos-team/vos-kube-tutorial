gcloud container clusters create vos-kube-cluster \
    --cluster-version=1.22 \
    --machine-type=e2-standard-2 \
    --disk-type=pd-ssd \
    --num-nodes 1