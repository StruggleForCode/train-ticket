FROM python:3

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

# ubantu
# RUN apt update -y
# RUN apt install -y cmake
# RUN apt install -y libgl1-mesa-glx

# 更换apt源为阿里云
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list


# 更新和安装依赖
RUN apt update -y && \
    apt install -y python3 python3-pip cmake libgl1-mesa-glx && \
    apt clean

# 安装依赖 CentOS
#RUN yum install -y epel-release && \
    #yum install -y python3 python3-pip cmake mesa-libGL && \
   # yum clean all

ENV PYTHONUNBUFFERED=TRUE

RUN mkdir -p /app
ADD . /app/
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:17001", "app:app"]

EXPOSE 17001