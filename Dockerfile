FROM ubuntu:18.04
RUN apt-get update -y > /dev/null
RUN apt-get  install -y python-pip python-dev build-essential > /dev/null
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["evilapp.py"]
