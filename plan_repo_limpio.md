# Plan de limpieza del repositorio — público para empleadores

---

## Sesión 1 — Auditoría y estructura

Lo primero que ve un empleador es el árbol de carpetas. Tiene que comunicar orden y criterio.

- Decidir el destino de `exploracion/` y `exploratory/` — son carpetas de trabajo sucio que no aportan valor público. O se eliminan o se fusionan en una sola carpeta `archivo/` marcada claramente como material de exploración
- Evaluar si `repaso_ejercicios.ipynb` se queda — tiene código incompleto y errores sin corregir, no es lo que un empleador quiere ver primero
- Renombrar carpetas a convención consistente: todo en minúsculas, sin mezclar inglés y español en el mismo nivel (`python_learning` junto a `EDAlearning` se ve inconsistente)
- Verificar `.gitignore` a fondo: que no haya nada de `.venv`, `__pycache__`, `.ipynb_checkpoints`, archivos de sistema
- **Renombrar todas las carpetas que estén en inglés a español** (solo nombres de carpetas, no archivos):
  - `python_learning/` → `aprendizaje_python/`
  - `pandas_learning/` → `aprendizaje_pandas/`
  - `matplotlib_learning/` → `aprendizaje_matplotlib/`
  - `exploratory/` → `exploratorio/`
  - `exploracion/` ya está en español — revisar si se fusiona con `exploratorio/`
- **Mejorar todo lo que está dentro de `EDAlearning/`**:
  - Revisar nombres de notebooks dentro de `dias/` — que sean descriptivos y consistentes
  - Decidir si `repaso_ejercicios.ipynb` se mueve, se elimina o se termina antes de publicar
  - Limpiar la carpeta `exploracion/` — solo dejar notebooks que estén completos y ejecutados

---

## Sesión 2 — README y reproducibilidad

Un repositorio sin README es invisible. Un empleador que llega y no entiende en 30 segundos qué hay, cierra la pestaña.

- README principal: qué es el proyecto, qué tecnologías usa, estructura de carpetas explicada, cómo instalar dependencias y correr los notebooks
- Instrucciones claras sobre los datasets: de dónde descargarlos (Kaggle), dónde ponerlos, por qué no están en el repo
- `requirements.txt` o `pyproject.toml` — sin esto el repo no es reproducible
- README secundario dentro de cada curso explicando qué cubre y en qué orden recorrerlo

---

## Sesión 3 — Calidad de notebooks

Los notebooks son el portfolio. Tienen que estar ejecutados, limpios y comunicar bien.

- Ejecutar todos los notebooks de principio a fin con el kernel limpio y guardar las salidas — GitHub muestra los outputs directamente, es lo que el empleador lee
- Revisar todos los markdown: sin typos, sin comentarios de "aquí vamos a aprender", tono profesional y directo
- Verificar que los gráficos de plotly y matplotlib se rendericen y se vean en la preview de GitHub
- Eliminar celdas vacías, outputs de error, prints de debug que se quedaron

---

## Sesión 4 — Presentación y revisión final

- Configurar el repositorio en GitHub: descripción corta, topics (`python`, `pandas`, `data-analysis`, `eda`, `matplotlib`, `plotly`), enlace al perfil de LinkedIn si aplica
- Añadir badges al README: Python version, licencia, last updated
- Revisar el repo completo desde una ventana de incógnito sin estar logueado — es exactamente lo que ve un empleador
- Escribir un párrafo de presentación del proyecto que puedas copiar y pegar en LinkedIn o en una entrevista

---

## Sesión 5 — Limpieza de código

El código ya funciona. En esta sesión solo se mejora con buenas prácticas, sin cambiar la lógica.

Aplica **únicamente a los notebooks dentro del repositorio del proyecto** — no tocar nada fuera.

- Revisar todos los `print()` — que sean informativos y no redundantes con lo que ya dice el output de Jupyter
- Eliminar comentarios que describen lo obvio — solo dejar comentarios donde el *por qué* no es evidente
- Verificar que las funciones (`find_project_root`, `limpiar_airbnb`, `segmentar`, etc.) tengan type hints o al menos sean legibles sin documentación extra
- Reemplazar cualquier `for` loop que pueda ser una operación vectorizada de pandas
- Revisar que ninguna celda tenga más de una responsabilidad — si hace dos cosas distintas, separarla en dos celdas
- Eliminar variables intermedias innecesarias — si solo se usan una vez, encadenar directamente
- Verificar nombres de variables: sin abreviaciones crípticas, sin `tmp`, `aux`, `x` sueltos fuera de contexto matemático

---

## Adicional — Limpiar archivos de Claude

Los archivos `.md` internos de Claude dentro del proyecto ya no son necesarios para el repositorio público.

- Revisar la carpeta `.claude/` dentro del proyecto y eliminar o archivar localmente los archivos MD que se generaron durante el desarrollo
- Confirmar que `.claude` sigue en `.gitignore` para que nunca se suba al repositorio público
- Esta limpieza es local — no afecta al historial de git ni a lo que ve el empleador

---

## Orden de impacto

| Prioridad | Sesión | Qué desbloquea |
|-----------|--------|----------------|
| 1 | Sesión 2 — README | Sin esto el repo no comunica nada |
| 2 | Sesión 3 — Notebooks ejecutados | El empleador necesita ver outputs |
| 3 | Sesión 1 — Estructura | Carpetas limpias y consistentes |
| 4 | Sesión 5 — Código limpio | Diferencia entre bueno y muy bueno |
| 5 | Sesión 4 — Presentación | El toque final |
| 6 | Adicional — Claude MD | Higiene local, no urgente |
