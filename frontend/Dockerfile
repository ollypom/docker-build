FROM python:3.8-slim

LABEL maintainer=olly@example.com

WORKDIR /app
ADD requirements.txt /app/requirements.txt 

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY ./myweb /app/

ENTRYPOINT ["python"]
CMD ["app.py"]