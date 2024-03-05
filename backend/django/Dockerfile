FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN pip install --upgrade pip 

WORKDIR /code
COPY requirements.txt .
RUN pip install --no-cache -r requirements.txt

COPY . .

EXPOSE 8000

RUN chmod +x /code/entrypoint.sh
ENTRYPOINT ["bash", "entrypoint.sh"]