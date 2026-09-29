FROM python:3.12-slim

WORKDIR /app

copy requirements.txt .

Run pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "app.py"]
