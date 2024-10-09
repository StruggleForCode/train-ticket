#!/bin/bash

# 阿里云镜像仓库地址
REPO_PREFIX="registry.cn-beijing.aliyuncs.com/train-ticket-lee"

# 获取所有镜像
IMAGES=$(docker images --format "{{.Repository}}:{{.Tag}}")

# 推送每个镜像
for IMAGE in $IMAGES; do
    # 拼接新的镜像名
    NEW_IMAGE="${REPO_PREFIX}/$(basename $IMAGE)"

    # 标记镜像
    docker tag "$IMAGE" "$NEW_IMAGE"

    # 推送镜像
    echo "推送镜像: $NEW_IMAGE"
    docker push "$NEW_IMAGE"
done