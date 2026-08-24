# Análisis de volatilidad de criptomonedas

Análisis histórico del riesgo y volatilidad de criptomonedas a partir de precios diarios OHLC. El sistema está diseñado para escalar a nuevas criptomonedas sin modificar la lógica principal.

## Objetivo

Medir y comparar la volatilidad histórica de distintas criptomonedas mediante métricas financieras estándar, identificar periodos de alta inestabilidad e identificar patrones estacionales.

## Métricas calculadas

- Retorno diario (`pct_change`)
- Volatilidad histórica (desviación estándar de retornos)
- Ratio riesgo/retorno
- Drawdown máximo desde pico histórico
- Mejor mes histórico para comprar (precio promedio mínimo)

## Stack técnico

- Python — pandas, numpy, matplotlib
- SQL — consultas de apoyo

## Estructura

```
analisis-volatilidad-cripto/
├── datos/
│   ├── crudos/       ← CSVs originales por criptomoneda (BTC.csv, ETH.csv…)
│   └── procesados/   ← precios_diarios.csv, recomendacion_mensual.csv
├── notebooks/        ← análisis y visualizaciones
├── sql/              ← consultas auxiliares
└── src/              ← pipeline de limpieza y cálculo de métricas
```

## Nota

Este proyecto no incluye predicción de precios ni recomendaciones de inversión.
