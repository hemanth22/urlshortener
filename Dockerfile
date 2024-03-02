FROM python:3.13.0a3-slim
COPY * /
RUN pip3 install -r /requirements.txt
COPY . /app
WORKDIR /app
ENV FLASK_APP=urlshort
EXPOSE 8000
CMD ["gunicorn"  , "-b", "0.0.0.0:8000", "urlshort:create_app()"]
