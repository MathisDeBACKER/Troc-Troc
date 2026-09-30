# Backend FastAPI

## Prérequis
- Python 3.11+

## Installation
```bash
cd backend
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\\Scripts\\activate
pip install -r requirements.txt
```

## Lancement
```bash
uvicorn app.main:app --reload
```

API disponible sur `http://127.0.0.1:8000`.

## Test
```bash
pytest
```
