# Homelab with Raspberry Pi 4B and MicroK8s
Resources for youtube playlist - สร้าง Home Lab Kubernetes cluster ด้วย Raspberry Pi สำหรับใช้งานในบ้านหรือห้องส่วนตัว

# Helpful command

Since I used docker for build the image, and it needs to support ARM instruction on Raspberry Pi

Need to check if current builder is support linux/arm/v7
```shell
docker buildx ls
```

If not, create new builder and using that one
```shell
docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap
```

Later, you can build image by multi-arch by this command
```shell
docker build --platform linux/arm64 -t marttp/customer-api .
docker push marttp/customer-api
docker build --platform linux/arm64 -t marttp/product-api .
docker push marttp/product-api
```