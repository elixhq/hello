# docker build -t "elix/hello" .
FROM elarasu/weave-ubuntu
ENV LANG en
ENV PORT 8080

RUN apt-get update
RUN apt-get install -y python3 build-essential gcc g++ python3-dev python3-setuptools python3-pip 
RUN export PIP_CERT=`python3 -m pip._vendor.requests.certs`

RUN pip3 install --upgrade pip setuptools

RUN mkdir -p /deploy/elix
WORKDIR /deploy/elix

# copy and install application
COPY . /deploy/elix/
RUN pip3 install -r /deploy/elix/requirements.txt

# cleanup
RUN rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

ENTRYPOINT gunicorn hello:app --log-file -

EXPOSE ${PORT}
