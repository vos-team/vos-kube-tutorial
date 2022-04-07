sudo apt install wget
wget https://docs.projectcalico.org/manifests/calico.yaml
kubectl apply -f calico.yaml
