microk8s helm repo add apisix https://charts.apiseven.com
microk8s helm repo add bitnami https://charts.bitnami.com/bitnami
microk8s helm repo update

ADMIN_API_VERSION=v3
microk8s helm install apisix apisix/apisix \
  --set service.type=NodePort \
  --set ingress-controller.enabled=true \
  --set apisix.ssl.enabled=true \
  --create-namespace \
  --namespace ingress-apisix \
  --set ingress-controller.config.apisix.serviceNamespace=ingress-apisix \
  --set ingress-controller.config.apisix.adminAPIVersion=$ADMIN_API_VERSION


# NOTES: Get the application URL by running these commands:
export NODE_PORT=$(kubectl get --namespace ingress-apisix -o jsonpath="{.spec.ports[0].nodePort}" services apisix-gateway)
export NODE_IP=$(kubectl get nodes --namespace ingress-apisix -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT

export NODE_PORT=$(microk8s kubectl get --namespace ingress-apisix -o jsonpath="{.spec.ports[0].nodePort}" services apisix-gateway)
export NODE_IP=$(microk8s kubectl get nodes --namespace ingress-apisix -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT