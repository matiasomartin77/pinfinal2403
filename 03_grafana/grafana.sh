#!/bin/bash

# Generar admin password random
ADMIN_PASSWORD=$(openssl rand -base64 12)

# Agregar Grafana Helm repo
sudo helm repo add grafana https://grafana.github.io/helm-charts

# Update repo
sudo helm repo update

# Crear namespace
sudo kubectl create namespace grafana 

# Instalar Grafana
sudo helm install grafana grafana/grafana \
  --namespace grafana \
  --values grafana.yaml \
  --set persistence.enabled=true \
  --set persistence.storageClassName=gp2 \
  --set adminPassword="$ADMIN_PASSWORD" \
  --set service.type=LoadBalancer


echo "finishing the installation..."
sudo sleep 60
sudo kubectl get all -n grafana


# Obtener  url grafana
grafana_ip="$(sudo kubectl get all -n grafana | awk 'NR==5{print $4}')"
echo "---------------------------------------------------------------------------------"
echo "You can view the page in your browser with this URL: $grafana_ip"
echo "Grafana admin password: $ADMIN_PASSWORD"
echo "---------------------------------------------------------------------------------"