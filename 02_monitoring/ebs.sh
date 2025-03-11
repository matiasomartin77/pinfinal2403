#!/bin/bash

# Deploy EBS CSI Driver
sudo kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.20"

# Verificar ebs-csi pods running
sudo kubectl get pods -n kube-system