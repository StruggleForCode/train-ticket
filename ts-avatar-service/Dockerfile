FROM python:3

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

# ubantu
# RUN apt update -y
# RUN apt install -y cmake
# RUN apt install -y libgl1-mesa-glx

# 安装依赖 CentOS
RUN yum install -y epel-release && \
    yum install -y python3 python3-pip cmake mesa-libGL && \
    yum clean all

ENV PYTHONUNBUFFERED=TRUE

RUN mkdir -p /app
ADD . /app/
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:17001", "app:app"]

EXPOSE 17001