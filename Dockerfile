FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install python-all -y \
    && apt install python-pip -y

ADD app/requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt

WORKDIR /usr/local/

ADD app/ app/

EXPOSE 5000
CMD ["python", "/usr/local/app/app.py"]