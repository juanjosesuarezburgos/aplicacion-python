FROM python:3.10-slim
WORKDIR /app
RUN pip install poetry
COPY pyproject.toml ./
RUN pip install poetry
RUN poetry install 
COPY . .
CMD ["python", "app.py"]
