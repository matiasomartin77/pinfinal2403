
#!/bin/bash

# Agregar repositorio de Prometheus a Helm
sudo helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
sudo helm repo update

# Crear NameSpace
sudo kubectl create namespace monitoring

# Instalar Prometheus
sudo helm install prometheus prometheus-community/prometheus --namespace monitoring --set alertmanager.persistentVolume.storageClass="gp2" --set server.persistentVolume.storageClass="gp2"

# Aplicar Volumen Persistente
sudo kubectl apply -f pv.yaml

# Chequeo pods
sudo kubectl get pods -n monitoring
