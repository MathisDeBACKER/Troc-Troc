# Troc-Troc

Squelette initial d'une application de troc avec un backend FastAPI (Python) et un frontend Flutter (Dart).

## Structure du projet

```text
Troc-Troc/
├── backend/
│   ├── app/
│   │   └── main.py
│   ├── tests/
│   │   └── test_health.py
│   ├── .env.example
│   ├── README.md
│   └── requirements.txt
└── frontend/
    ├── lib/
    │   ├── main.dart
    │   └── services/api_service.dart
    ├── analysis_options.yaml
    └── pubspec.yaml
```

## Prérequis

- Python 3.11+
- Flutter SDK (avec Dart)

## Lancer le backend

```bash
cd backend
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\\Scripts\\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

- API: `http://127.0.0.1:8000`
- Vérification rapide: `GET /` et `GET /health`
- Documentation FastAPI: `http://127.0.0.1:8000/docs`

## Lancer les tests backend

```bash
cd backend
source .venv/bin/activate  # Windows: .venv\\Scripts\\activate
pytest
```

## Lancer le frontend Flutter

```bash
cd frontend
flutter pub get
flutter run
```

L'application affiche un bouton "Tester le backend" qui appelle `/health`.

## Adresse API Flutter selon la plateforme

L'URL API est configurable via `--dart-define`:

```bash
flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8000
```

Exemples courants :

- Navigateur desktop/web: `http://127.0.0.1:8000`
- Android Emulator: `http://10.0.2.2:8000`
- iOS Simulator: `http://127.0.0.1:8000`
- Appareil physique: `http://<IP_LOCALE_MACHINE>:8000`

## Hors périmètre de ce squelette

- Authentification
- Base de données
- Logique métier des annonces
