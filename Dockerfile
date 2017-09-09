FROM alpine:3.6

ARG DB_HOST
ARG DB_USER
ARG DB_USER_PWD
ARG DB_NAME

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
COPY static /src/static
COPY templates /src/templates

RUN sed -i "s/@DB_HOST/$DB_HOST/g" /src/dbconnect.py
RUN sed -i "s/@DB_USER/$DB_USER/g" /src/dbconnect.py
RUN sed -i "s/@DB_USER_PWD/$DB_USER_PWD/g" /src/dbconnect.py
RUN sed -i "s/@DB_NAME/$DB_NAME/g" /src/dbconnect.py

CMD python3 /src/main.py