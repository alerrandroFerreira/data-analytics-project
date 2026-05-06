# 01 — Exploración y Diagnóstico

## Situación

Nuevo dataset. Sin garantia de su calidad. Lo primero,
antes de cualquier análisis, limpieza o modelo.

Este workflow produce una diagnosis estructurada que responde una sola pregunta:
**¿Este dataset es apto para el propósito que me están pidiendo?**

---

## Cuándo usas este workflow

- Primera vez que ves un dataset, sea cual sea su origen
- Antes de comprometerte con un entregable — si los datos no aguantan, el análisis tampoco
- Cuando alguien te dice "los datos están limpios" y necesitas verificarlo tú mismo
- Como paso cero obligatorio antes de los workflows 02, 03, 04, 05, 07, 09, 10

---

## Las preguntas correctas

Un diagnóstico profesional no pregunta "¿qué columnas hay?". Pregunta:

```text
¿El volumen de datos es suficiente para que los resultados sean significativos?
¿Los nulos son ruido o son información? ¿Su patrón es aleatorio o sistemático?
¿Hay columnas que parecen útiles pero son inutilizables en la práctica?
¿Las distribuciones tienen sentido para el dominio — o hay señales de error en origen?
¿La cardinalidad de las categóricas permite segmentar o hay demasiada fragmentación?
¿Qué columna es el identificador único real — y es realmente único?
¿Los rangos de las variables numéricas son coherentes con el negocio?
¿Hay columnas correlacionadas que apuntan a redundancia o a un problema de diseño del dato?
¿Qué decisiones de limpieza van a ser controvertidas y necesitan ser documentadas?
¿Con estos datos, qué puedo responder — y qué no puedo responder aunque me lo pidan?
```

---

## Output

```text
resultado/resumen_columnas.csv       → calidad por columna: tipo, nulos, cardinalidad, rango
resultado/distribucion_numericas.png → distribuciones visuales para detección rápida de anomalías
resultado/informe_diagnostico.txt    → hallazgos priorizados + decisión de siguiente paso
```

---

## Criterio de salida

El workflow está completo cuando puedes responder esto en una frase:

> *"El dataset tiene [N] filas útiles, [X] columnas aprovechables, los problemas críticos son [lista] y el siguiente paso es [workflow / decisión]."*

Si no puedes formular esa frase, falta diagnóstico.
