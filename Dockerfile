FROM python:3.6.6-alpine3.8

RUN apk --no-cache add g++ \
      && apk --no-cache add zeromq-dev make \
      && pip install --upgrade pip \
      && pip install pyzmq coverage gevent boto3

WORKDIR /usr/src/app
COPY . .
RUN python setup.py build \
  && python setup.py install

EXPOSE 8089 5557 5558

ENTRYPOINT ["locust"]
