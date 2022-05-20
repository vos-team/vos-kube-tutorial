# kubernetes 클러스터 직접 생성하기

## kubeadm 설치

```sh
bash install_kubeadm.sh
```

## 도커 설치

```sh
bash install_docker.sh
bash set_docker_systemd.sh
```

## 클러스터 생성

```sh
swapoff -a # 스왑메모리 해제

sudo kubeadm init

bash set_kubectl_config.sh
```

## CNI 등록

```sh
bash apply_calico_cni.sh
```

## 클러스터 노드 조회

```sh
kubectl get nodes
# NAME         STATUS   ROLES                  AGE    VERSION
# instance-2   Ready    control-plane,master   111s   v1.23.5
```
