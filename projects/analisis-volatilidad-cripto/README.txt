1. Descripción

Este proyecto analiza la volatilidad y el riesgo histórico de distintas criptomonedas a partir de datos diarios de precios (OHLC).
El objetivo es proporcionar una visión estructurada y comparable del riesgo, alineada con los criterios utilizados en entornos empresariales y financieros.

El sistema ha sido diseñado con un enfoque escalable, permitiendo incorporar nuevas criptomonedas sin modificar la lógica principal del análisis ni las visualizaciones.

2. Objetivo del proyecto

Medir y comparar la volatilidad histórica de diferentes criptomonedas

Evaluar el riesgo mediante métricas financieras estándar

Identificar periodos de alta inestabilidad del mercado

Comunicar resultados de forma clara mediante visualizaciones orientadas a negocio

3. Alcance

Incluye:

Análisis histórico de precios

Cálculo de métricas de riesgo

Visualización en dashboard interactivo

Arquitectura de datos escalable

No incluye:

Predicción de precios

Trading algorítmico

Recomendaciones de inversión

Notebook 01: Limpieza y Unificación de Datos
_______________________________________________________________________________
PRIMER NOTEBOOK

Este notebook tiene como objetivo limpiar y unificar los datos de criptomonedas que se encuentran en archivos CSV dentro de la carpeta datos/crudos/. Cada notebook es un entorno interactivo que permite escribir código, ejecutar análisis y documentar procesos de manera reproducible.

El archivo principal de este notebook es: 01_limpieza_datos.ipynb.

1. Importación de librerías
import pandas as pd
import os
from glob import glob


pandas: para manipular y limpiar datos en DataFrames, además de guardarlos en CSV.

os: para trabajar con rutas y nombres de archivos.

glob: para listar automáticamente todos los archivos CSV dentro de la carpeta de datos crudos.

2. Configuración de la carpeta de datos
carpeta_crudos = "../datos/crudos/"
archivos = glob(os.path.join(carpeta_crudos, "*.csv"))


Define la ruta donde se encuentran los archivos CSV de criptomonedas.

glob busca todos los archivos que terminen en .csv.

La variable archivos será una lista con todas las rutas de los CSV que se van a procesar.

3. Lectura y limpieza de cada archivo
for archivo in archivos:
    cripto_id = os.path.basename(archivo).split(".")[0].upper()
    df = pd.read_csv(archivo, encoding="utf-8")


Se recorre cada archivo de la lista archivos.

cripto_id se obtiene del nombre del archivo (sin extensión) y se convierte a mayúsculas.

Se lee el CSV con codificación UTF-8 para evitar problemas con caracteres especiales.

4. Renombrado de columnas
df = df.rename(columns={
    "ticker": "cripto_id",
    "date": "fecha",
    "open": "apertura",
    "high": "maximo",
    "low": "minimo",
    "close": "cierre"
})


Se estandarizan los nombres de columnas a español y formato consistente.

Esto permite que el pipeline sea escalable y que todos los archivos tengan las mismas columnas.

5. Asignación de la criptomoneda
df["cripto_id"] = cripto_id


Garantiza que todos los registros tengan la columna correcta de la cripto, incluso si algún CSV tenía errores.

6. Conversión de fechas
df["fecha"] = pd.to_datetime(df["fecha"], dayfirst=True)


Convierte la columna fecha a tipo datetime.

Se asegura que las fechas estén en formato día-mes-año, necesario para análisis temporal.

7. Conversión de precios a valores numéricos
df[["apertura","maximo","minimo","cierre"]] = df[["apertura","maximo","minimo","cierre"]].astype(float)


Convierte los precios a float para que puedan usarse en cálculos financieros posteriores.

8. Ordenamiento y almacenamiento temporal
df = df.sort_values("fecha")
lista_dfs.append(df)


Ordena los registros de cada criptomoneda de manera creciente por fecha.

Cada DataFrame se añade a lista_dfs para luego combinar todos en un solo DataFrame.

9. Concatenación de todos los DataFrames
df_final = pd.concat(lista_dfs, ignore_index=True)


Combina todos los datos de las criptomonedas en un solo DataFrame.

ignore_index=True asegura que los índices sean consecutivos en el DataFrame final.

10. Guardado del dataset unificado
ruta_procesado = "../datos/procesados/precios_diarios.csv"
df_final.to_csv(ruta_procesado, index=False, encoding="utf-8")


Guarda el dataset limpio y unificado en la carpeta procesados.

Un dataset es una colección de datos estructurados lista para análisis.

UTF-8 asegura compatibilidad con Power BI, Python o SQL.

11. Resumen del dataset
print("Dataset unificado y guardado en:", ruta_procesado)
print("Número de registros:", len(df_final))
print("Criptomonedas incluidas:", df_final["cripto_id"].unique())


Muestra dónde se guardó el archivo.

Indica la cantidad total de registros procesados.
_______________________________________________________________________________

# ====================================================
# LISTA UNIVERSAL DE COMANDOS PYTHON PARA ANÁLISIS DE DATOS
# Proyecto: Criptomonedas
# Incluye limpieza, unificación, métricas estadísticas, recomendaciones y visualizaciones
# ====================================================

# ---------------------------------------------
# 1. IMPORTACIÓN DE LIBRERÍAS
# ---------------------------------------------
import pandas as pd              # Para manipular datos en DataFrames
import numpy as np               # Para cálculos matemáticos y estadísticos
import os                        # Para trabajar con rutas y archivos
from glob import glob            # Para listar archivos de manera automática
import matplotlib.pyplot as plt  # Para crear gráficos y visualizaciones

# ---------------------------------------------
# 2. LISTAR ARCHIVOS CSV EN UNA CARPETA
# ---------------------------------------------
carpeta_crudos = "../datos/crudos/"
archivos = glob(os.path.join(carpeta_crudos, "*.csv"))
# Busca todos los archivos .csv dentro de la carpeta crudos
# Útil para procesar múltiples criptomonedas automáticamente

# ---------------------------------------------
# 3. LEER ARCHIVOS CSV
# ---------------------------------------------
df = pd.read_csv("../datos/crudos/BTC.csv", encoding="utf-8")
# Lee el CSV y lo carga en un DataFrame
# encoding="utf-8" evita problemas con caracteres especiales

# ---------------------------------------------
# 4. RENOMBRAR COLUMNAS
# ---------------------------------------------
df = df.rename(columns={
    "ticker": "cripto_id",
    "date": "fecha",
    "open": "apertura",
    "high": "maximo",
    "low": "minimo",
    "close": "cierre"
})
# Homogeneiza los nombres de columnas en español para todo el pipeline

# ---------------------------------------------
# 5. CONVERTIR TIPOS DE DATOS
# ---------------------------------------------
df["fecha"] = pd.to_datetime(df["fecha"], dayfirst=True)  # Fecha a tipo datetime
df[["apertura","maximo","minimo","cierre"]] = df[["apertura","maximo","minimo","cierre"]].astype(float)
# Convierte precios a float para cálculos financieros
# Convierte fechas a datetime para análisis temporal

# ---------------------------------------------
# 6. ORDENAR Y CONCATENAR DATAFRAMES
# ---------------------------------------------
df = df.sort_values("fecha")      # Ordena por fecha
lista_dfs = [df]                  # Lista temporal de DataFrames
df_final = pd.concat(lista_dfs, ignore_index=True)
# Combina múltiples DataFrames en uno solo
# ignore_index=True asegura índices consecutivos

# ---------------------------------------------
# 7. GUARDAR DATAFRAME EN CSV
# ---------------------------------------------
ruta_procesado = "../datos/procesados/precios_diarios.csv"
df_final.to_csv(ruta_procesado, index=False, encoding="utf-8")
# Guarda dataset limpio y unificado
# index=False para no incluir el índice en el CSV

# ---------------------------------------------
# 8. AGRUPAR DATOS POR CRIPTO
# ---------------------------------------------
grouped = df.groupby("cripto_id")
# Permite aplicar cálculos o métricas por cada criptomoneda

# ---------------------------------------------
# 9. CALCULAR RETORNOS DIARIOS
# ---------------------------------------------
df["retorno_diario"] = df.groupby("cripto_id")["cierre"].pct_change()
# Porcentaje de cambio diario en el precio de cierre
# Base para métricas financieras

# ---------------------------------------------
# 10. CALCULAR DRAWNDOWN
# ---------------------------------------------
df["cierre_max"] = df.groupby("cripto_id")["cierre"].cummax()
df["drawdown"] = df["cierre_max"] - df["cierre"]
# Mide caída desde el máximo histórico
# Útil para riesgo y análisis de volatilidad

# ---------------------------------------------
# 11. CALCULAR ESTADÍSTICAS AGREGADAS POR CRIPTO
# ---------------------------------------------
estadisticas = df.groupby("cripto_id").apply(lambda g: pd.Series({
    "retorno_promedio_diario": g["retorno_diario"].mean(),
    "volatilidad": g["retorno_diario"].std(),
    "ratio_riesgo_retorno": g["retorno_diario"].mean()/g["retorno_diario"].std() if g["retorno_diario"].std() != 0 else np.nan,
    "precio_minimo": g["cierre"].min(),
    "fecha_precio_minimo": g.loc[g["cierre"].idxmin(),"fecha"],
    "drawdown_max": (g["cierre"].cummax() - g["cierre"]).max()
}))
# Retorno promedio, volatilidad, ratio riesgo/retorno, precio mínimo y fecha, drawdown máximo

# ---------------------------------------------
# 12. CREAR COLUMNA MES Y AÑO
# ---------------------------------------------
df["mes"] = df["fecha"].dt.month
df["año"] = df["fecha"].dt.year
# Facilita análisis mensual y anual
# Base para recomendaciones estadísticas por mes

# ---------------------------------------------
# 13. PROMEDIO MENSUAL
# ---------------------------------------------
promedio_mensual = df.groupby(["cripto_id","mes"])["cierre"].mean().reset_index()
# Calcula el precio promedio por mes para cada cripto

# ---------------------------------------------
# 14. MEJOR MES PARA COMPRAR
# ---------------------------------------------
mejor_mes = promedio_mensual.loc[promedio_mensual.groupby("cripto_id")["cierre"].idxmin()]
# Encuentra el mes histórico con el precio promedio más bajo
# Base para recomendaciones de compra

# ---------------------------------------------
# 15. FILTRAR DATAFRAMES
# ---------------------------------------------
btc = df[df["cripto_id"]=="BTC"]
# Extrae un subconjunto de datos por criptomoneda

# ---------------------------------------------
# 16. GRÁFICOS SIMPLES
# ---------------------------------------------
plt.figure(figsize=(12,6))
for cripto in df["cripto_id"].unique():
    subset = df[df["cripto_id"]==cripto]
    plt.plot(subset["fecha"], subset["cierre"], label=cripto)
plt.xlabel("Fecha")
plt.ylabel("Precio")
plt.title("Precio histórico de criptomonedas")
plt.legend()
plt.show()
# Gráfico de líneas de precios por cripto

# ---------------------------------------------
# 17. GRÁFICOS DESTACANDO MEJOR MES/FECHA
# ---------------------------------------------
plt.figure(figsize=(12,6))
for cripto in df["cripto_id"].unique():
    subset = promedio_mensual[promedio_mensual["cripto_id"]==cripto]
    mejor = mejor_mes[mejor_mes["cripto_id"]==cripto]
    plt.bar(subset["mes"], subset["cierre"], color="skyblue")
    plt.bar(mejor["mes"], mejor["cierre"], color="red", label="Mejor mes")
plt.title("Mejor mes para comprar según histórico")
plt.xlabel("Mes")
plt.ylabel("Precio promedio")
plt.legend()
plt.show()

# ---------------------------------------------
# 18. GUARDAR RECOMENDACIONES EN CSV
# ---------------------------------------------
ruta_recomendacion = "../datos/procesados/recomendacion_mensual.csv"
mejor_mes.to_csv(ruta_recomendacion, index=False, encoding="utf-8")
# Permite guardar recomendaciones de compra en CSV para análisis futuro
