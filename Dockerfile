# Usar uma imagem base do Python
FROM python:3.9-slim

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instalar as dependências necessárias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o modelo e o código para o diretório de trabalho
COPY models/modelo_xgboost.joblib /app/models/
COPY . /app/

# Expor a porta que o Flask irá utilizar
EXPOSE 8000

# Comando para iniciar o servidor FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
