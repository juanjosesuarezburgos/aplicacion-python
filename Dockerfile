FROM python:3.10-slim

WORKDIR /app

RUN pip install poetry

COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false && poetry install --no-dev

COPY . .

CMD ["python", "tu_script_principal.py"]
