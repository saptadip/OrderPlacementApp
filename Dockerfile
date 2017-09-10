FROM alpine:3.6

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

COPY requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt

COPY main.py /src
COPY dbconnect.py /src
COPY plotgraph.py /src
COPY static /src/static
COPY templates /src/templates

CMD python3 /src/main.py