from pathlib import Path

import pandas as pd
import matplotlib.pyplot as plt


def inspect_dataset(df: pd.DataFrame, nombre: str = "dataset") -> pd.DataFrame:
    """Devuelve tabla de calidad por columna: tipo, nulos, cardinalidad y muestra de valor."""
    resumen = pd.DataFrame({
        "dtype":            df.dtypes,
        "nulos_pct":        (df.isnull().mean() * 100).round(1),
        "unicos":           df.nunique(),
        "cardinalidad_pct": (df.nunique() / len(df) * 100).round(1),
        "muestra":          [df[c].dropna().iloc[0] if df[c].notna().any() else None
                             for c in df.columns],
    })

    print(f"\n── {nombre.upper()} ({df.shape[0]:,} filas × {df.shape[1]} columnas) ──")
    print(f"Memoria: {df.memory_usage(deep=True).sum() / 1e6:.1f} MB")

    return resumen.sort_values("nulos_pct", ascending=False)


def plot_distributions(
    df: pd.DataFrame,
    columnas: list[str],
    titulo: str,
    ruta_salida: Path,
    nombre_archivo: str = "distribucion_numericas.png",
) -> None:
    """Guarda un grid de histogramas para las columnas indicadas."""
    n_cols = 4
    n_rows = -(-len(columnas) // n_cols)  # ceil division sin math

    fig, axes = plt.subplots(n_rows, n_cols, figsize=(n_cols * 4, n_rows * 3.5))
    axes = axes.flatten()

    for i, col in enumerate(columnas):
        axes[i].hist(df[col].dropna(), bins=40, color="steelblue", edgecolor="white", linewidth=0.4)
        axes[i].set_title(col, fontsize=10, fontweight="bold")
        axes[i].tick_params(labelsize=8)

    for j in range(len(columnas), len(axes)):
        axes[j].set_visible(False)

    fig.suptitle(titulo, fontsize=13, fontweight="bold", y=1.01)
    plt.tight_layout()
    fig.savefig(ruta_salida / nombre_archivo, dpi=150, bbox_inches="tight")
    plt.close()

    print(f"Guardado: {ruta_salida / nombre_archivo}")


def export_text_report(contenido: str, ruta_salida: Path, nombre_archivo: str = "informe_diagnostico.txt") -> None:
    """Escribe el informe de diagnóstico en resultado/ como trazabilidad del estado inicial del dataset."""
    ruta_completa = ruta_salida / nombre_archivo
    ruta_completa.write_text(contenido, encoding="utf-8")
    print(f"Guardado: {ruta_completa}")
