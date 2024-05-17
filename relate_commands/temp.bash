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