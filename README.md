# Portafolio de análisis de datos

Repositorio de aprendizaje y proyectos prácticos de análisis de datos con Python. Cubre el ciclo completo: limpieza, exploración, visualización y segmentación.

## Tecnologías

- **Python 3.11** — pandas, numpy, matplotlib, plotly, seaborn
- **Jupyter Lab** — notebooks interactivos con backend `ipympl`
- **Excel / Power BI** — análisis y dashboards (carpeta `projects/`)

## Estructura

```
├── notebooks/
│   ├── ciencia_de_datos/      # Cursos de Python, pandas y matplotlib
│   │   ├── python/            # 10 notebooks — tipos, funciones, OOP
│   │   ├── pandas/            # 10 notebooks — Series a nivel profesional
│   │   └── matplotlib/        # 8 notebooks — visualización con OO API
│   └── eda/                   # Análisis exploratorio aplicado
│       ├── dias/              # 8 sesiones de EDA progresivo (Superstore + Airbnb)
│       ├── exploracion/       # Análisis libres sobre datasets variados
│       └── repaso_ejercicios.ipynb  # Ejercicios de práctica tipo empresa
│
├── projects/                  # Proyectos completos con Excel y Power BI
│   ├── superstore-analysis/
│   ├── business-metrics-pivot-tables/
│   ├── powerbi-company-dashboard/
│   └── ...
│
├── data/
│   └── external/              # Datasets locales (no versionados — ver abajo)
│
└── requirements.txt
```

## Datasets

Los datasets no están incluidos en el repositorio por su tamaño. Para ejecutar los notebooks descarga los siguientes archivos y colócalos en `data/external/`:

| Archivo | Fuente |
|---------|--------|
| `train.csv` | [Superstore Sales — Kaggle](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting) |
| `Listings.csv` | [Airbnb Open Data — Kaggle](https://www.kaggle.com/datasets/arianazmoudeh/airbnbopendata) |
| `online_retail_II.csv` | [Online Retail II — UCI via Kaggle](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci) |

## Instalación

```bash
git clone https://github.com/AlerrHeron/data-analytics-project.git
cd data-analytics-project

python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

pip install -r requirements.txt
jupyter lab
```

## Recorrido recomendado

1. `notebooks/ciencia_de_datos/python/` — fundamentos de Python
2. `notebooks/ciencia_de_datos/pandas/` — manipulación de datos
3. `notebooks/ciencia_de_datos/matplotlib/` — visualización
4. `notebooks/eda/dias/` — EDA aplicado en orden (01 → 08)
5. `notebooks/eda/repaso_ejercicios.ipynb` — práctica autónoma
