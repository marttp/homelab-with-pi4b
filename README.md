# Homelab with Raspberry Pi 4B and MicroK8s
Resources for youtube playlist - สร้าง Home Lab Kubernetes cluster ด้วย Raspberry Pi สำหรับใช้งานในบ้านหรือห้องส่วนตัว

# Helpful command

Since I used docker for build the image, and it needs to support ARM instruction on Raspberry Pi

You can build image by this command (Specific to run on ARM x64 v8 alias arm64)
```shell
docker build --platform linux/arm64 -t marttp/customer-api .
docker push marttp/customer-api
docker build --platform linux/arm64 -t marttp/product-api .
docker push marttp/product-api
```

If you need multi-arch support, please kindly take a look on `buildx`
```shell
docker buildx ls
docker buildx inspect --bootstrap
```