FROM python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
COPY docker-entrypoint.sh /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY postgresstest /code/
RUN chmod 755 docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
