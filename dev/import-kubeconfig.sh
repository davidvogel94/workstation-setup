#!/bin/sh

## Default usage  - ./import-kubeconfig local local
## As per https://microk8s.io/docs/working-with-kubectl as can just dump out a valid kube config file from microk8s, however we're trying to keep our config files intact, so the below attempts to do this.

CERT=$(cat /var/snap/microk8s/current/credentials/client.config | yq e '.clusters[0].cluster.certificate-authority-data' -)
SERVER=$(cat /var/snap/microk8s/current/credentials/client.config | yq e '.clusters[0].cluster.server' -)
CLUSTER_NAME=$1
CONTEXT_NAME=$2
KUBE_USER=$2-admin
TOKEN=$(microk8s.config | yq e '.users[0].user.token' -)

kubectl config set clusters.$CLUSTER_NAME.certificate-authority-data $CERT
kubectl config set-cluster $CLUSTER_NAME --server=$SERVER
kubectl config set-credentials $KUBE_USER --token=$TOKEN
kubectl config set-context $CONTEXT_NAME --cluster=$CLUSTER_NAME --user=$KUBE_USER

echo kubectl config set clusters.$CLUSTER_NAME.certificate-authority-data $CERT
echo kubectl config set-cluster $CLUSTER_NAME --server=$SERVER
echo kubectl config set-credentials $KUBE_USER --token=$TOKEN --username admin
echo kubectl config set-context $CONTEXT_NAME --cluster=$CLUSTER_NAME --user=$KUBE_USER
