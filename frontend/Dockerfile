FROM python:3.8

LABEL maintainer=olly@example.com

WORKDIR /app
ADD requirements.txt /app/requirements.txt 

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY ./myweb /app/

ENTRYPOINT ["python"]
CMD ["app.py"]