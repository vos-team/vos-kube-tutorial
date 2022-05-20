# kubernetes 클러스터 직접 생성하기

## kubeadm 설치

```sh
bash install_kubeadm.sh
```

## 도커 설치 및 설정

```sh
bash install_docker.sh
bash set_docker_config.sh
```

## 클러스터 생성

```sh
swapoff -a # 스왑메모리 해제

sudo kubeadm init #--apiserver-cert-extra-sans xxx.xxx.xxx.xxx
# 외부에서 원격으로 클러스터 컨트롤 하려면 --apiserver-cert-extra-sans 옵션 추가

bash set_kubectl_config.sh
```

## CNI 등록

```sh
bash apply_calico_cni.sh
```

## 클러스터 pod 상태 조회

```sh
kubectl get po -A
# NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
# kube-system   calico-kube-controllers-56cdb7c587-s8vg6   0/1     Pending   0          15m
# kube-system   calico-node-4c797                          1/1     Running   0          15m
# kube-system   coredns-6d4b75cb6d-dt88z                   1/1     Running   0          15m
# kube-system   coredns-6d4b75cb6d-l4rhx                   1/1     Running   0          15m
# kube-system   etcd-instance-3                            1/1     Running   1          16m
# kube-system   kube-apiserver-instance-3                  1/1     Running   1          16m
# kube-system   kube-controller-manager-instance-3         1/1     Running   0          16m
# kube-system   kube-proxy-qsdrc                           1/1     Running   0          15m
# kube-system   kube-scheduler-instance-3                  1/1     Running   1          16m
```
