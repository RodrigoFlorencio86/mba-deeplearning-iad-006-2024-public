from fastapi import FastAPI
import joblib
from pydantic import BaseModel
import xgboost as xgb

# Inicializar a aplicação FastAPI
app = FastAPI()

# Carregar o modelo XGBoost previamente treinado
model = joblib.load("modelo_xgboost.joblib")

# Definir a estrutura dos dados de entrada
class ModelInput(BaseModel):
    input: list

# Rota para realizar predições
@app.post("/predict")
def predict(data: ModelInput):
    dmatrix = xgb.DMatrix([data.input])  # Converter os dados de entrada para o formato DMatrix
    prediction = model.predict(dmatrix)
    return {"prediction": prediction.tolist()}