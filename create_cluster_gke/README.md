# kubernetes 클러스터 직접 생성하기

## gcloud 세팅

[설치](https://cloud.google.com/sdk/docs/install-sdk?hl=ko)

```sh
# gcp 계정 로그인
gcloud auth login

# gke 사용 권한이 있는 project 설정
gcloud set project [project id]

# 클러스터 노드 생성할 존을 asia-northeast3-a 로 설정 (a,b,c 중 아무거나 선택해도 됨)
gcloud set compute/zone asia-northeast3-a
```

구글클라우드 웹 콘솔에서 'Kubernetes Engine 관리자' 권한 설정해줘야 함.

1. 왼쪽 메인 메뉴 -> IAM 및 관리자 -> IM 선택
2. 주구성원에서 자신의 email 선택 후 오른쪽 수정버튼 클릭
3. 다른역할 추가 -> 'Kubernetes Engine 관리자' 선택 후 저장

## 클러스터 생성

```sh
# gcloud container clusters create vos-kube-cluster \ vos-kube-cluster: 클러스터 이름
#     --cluster-version=1.22 \ 클러스터 버전 명시
#     --machine-type=e2-standard-2 \ 클러스터 노드의 인스턴스 타입(cpu, ram 사양)
#     --disk-type=pd-ssd \ 클러스터 노드의 디스크 타입
#     --num-nodes 1 클러스터에 처음 생성할 노드 개수
bash create_cluster.sh
```

## 클러스터 인증정보 등록

```sh
gcloud container clusters get-credentials vos-kube-cluster
```

## 인증여부 확인

```sh
kubectl get nodes
# NAME                    STATUS   ROLES    AGE    VERSION
# vos-kube-cluster-....   Ready    <none>   6m6s   v1.22.8-gke.200
```
