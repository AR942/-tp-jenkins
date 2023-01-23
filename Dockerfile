# Dockerfile to build a flask app
FROM python:3.9
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt 
COPY . . 
CMD ["python", "app.py"]
#CMD ["python", "-m", "flask", "run"]

