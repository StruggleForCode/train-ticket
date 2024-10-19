FROM python:3.7.4

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

RUN mkdir -p /app
WORKDIR /app

# 痛苦.jpg, 手动打的镜像
# docker build --network=host -t registry.cn-beijing.aliyuncs.com/train-ticket-lee/ts-voucher-service:v1.0 .

COPY requirements.txt ./
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
RUN pip config set install.trusted-host mirrors.aliyun.com
RUN pip install --default-timeout=100 cryptography
RUN pip install --default-timeout=100 --no-cache-dir -r requirements.txt

ADD ./server.py /app/
CMD [ "python", "server.py" ]

EXPOSE 16101