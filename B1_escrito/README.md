# Carpeta `B1_escrito`

## Propósito general
Esta carpeta reúne la documentación escrita de los nueve enunciados del bloque B1. Cada ejercicio se desarrolla en un archivo LaTeX dedicado que sigue la misma secuencia metodológica usada en los cuadernos de clase (`trabajo.ipynb`, `trabajo_step_by_step.ipynb`). El objetivo es poder regenerar los resultados numéricos, tablas y figuras a partir de los recursos originales y disponer de un informe autocontenido que explique los procedimientos, decisiones y conclusiones.

## Estructura
```
B1_escrito/
  README.md                ← este índice y guía de reproducción
  assets/                  ← figuras exportadas de los notebooks
  enunciado_01/…/enunciado_09/
      enunciado_##.tex     ← desarrollo completo en LaTeX
      (enunciado_##.pdf)   ← PDF compilado desde el .tex (generar tras editar)
  anexos/
      plantillas.tex       ← macros y tablas de apoyo compartidas
      (archivos auxiliares)
```

### Recomendaciones de nomenclatura
* Las figuras deben guardarse en `assets/` con nombres descriptivos (`e01_zoo_pca.png`, `e07_faces_reconstruccion.png`, etc.).
* Las tablas extensas o datos intermedios pueden quedar en `anexos/` y enlazarse desde los `.tex` mediante `\input` o `\includegraphics`.
* Los PDF deben generarse tras editar cada `.tex` con `latexmk -pdf enunciado_##.tex` desde su carpeta correspondiente.

## Reconstrucción de recursos
1. **Scripts auxiliares (`class_helpers.py`)**
   * `ensure_practice_paths()` crea la jerarquía esperada de carpetas (`data/`, `img/`, etc.) y descarga los conjuntos si no existen.
   * `ensure_image_resources()` descarga y descomprime las imágenes `.ppm` utilizadas en los ejercicios de cuantización y estudio de tamaños.
   * `ensure_faces_dataset()` genera `faces.mat` a partir de las imágenes de rostros; requiere `scipy` para guardar el archivo en formato MATLAB.

   > Ejecuta estos helpers desde la raíz del proyecto o importa las funciones en un cuaderno/notebook.

2. **Dependencias mínimas**
   * Python 3.9+
   * `numpy`, `pandas`, `matplotlib`, `seaborn`
   * `scikit-learn` (K-Means, clustering jerárquico, PCA, métricas)
   * `scipy` (lectura/escritura de `.mat` y distancias jerárquicas)
   * `scikit-image` o `Pillow` para cargar/guardar imágenes `.ppm`

3. **Recursos específicos**
   * `zoo.data`: disponible en `data/zoo/` tras ejecutar `ensure_practice_paths()`.
   * Imágenes `.ppm`: carpeta `img/ppm/` creada por `ensure_image_resources()`.
   * `faces.mat`: en `data/faces/`, generado con `ensure_faces_dataset()` (requiere `scikit-learn` para PCA y `scipy.io.savemat`).

## Metodología transversal
Cada enunciado sigue la misma columna vertebral metodológica:
1. Carga y descripción de los datos.
2. Visualización exploratoria y análisis de variables relevantes.
3. Selección y transformación de características (incluye imputación o tratamiento de ausentes si procede).
4. Reducción de dimensionalidad y/o escalado.
5. Tratamiento de desbalanceos cuando aplica.
6. Modelado o agrupamiento con el algoritmo indicado.
7. Evaluación cuantitativa y cualitativa.
8. Interpretación de resultados y conclusiones.

En los `.tex`, cada paso se documenta explícitamente en secciones tituladas **Datos**, **Preprocesamiento**, **Modelado**, **Evaluación** y **Conclusiones**, acompañadas de las figuras/tablas pertinentes.

## Extracto de figuras y tablas
Para cada enunciado:
* Exporta las figuras generadas en los notebooks (`trabajo.ipynb`, `trabajo_step_by_step.ipynb`) como PNG o PDF mediante `plt.savefig(...)` y consérvalas en `assets/`.
* Incluye en los documentos los valores numéricos clave (inercia, silhouette, varianza explicada, F1, tamaños de archivo, etc.) copiándolos directamente de las salidas de los notebooks. Evita depender solo de referencias al código; cada `.tex` debe poder leerse sin ejecutar Python.
* Anota en el pie de figura o nota al pie cómo se reproduce cada gráfico (nombre del notebook, celda, función utilizada).

## Introducción y conclusión global
* La introducción general debe resumir los objetivos del bloque B1, contextualizar los datasets (zoo, imágenes, rostros) y mencionar la metodología transversal.
* La conclusión consolidará las observaciones principales: desempeño comparado de clustering vs. clasificación, efecto de la reducción de dimensionalidad, impacto de la cuantización en las imágenes, etc.

## Checklist de control de calidad
Incluye en cada `.tex` una checklist en LaTeX similar a:
```latex
\begin{itemize}
  \item[$\square$] Se documenta el preprocesamiento completo.
  \item[$\square$] Se muestran los cálculos manuales clave.
  \item[$\square$] Se comparan resultados manuales con los obtenidos por software.
  \item[$\square$] Se interpretan los resultados en el contexto del problema.
\end{itemize}
```
Esta lista permite verificar que cada ejercicio mantiene coherencia con el resto del dossier.

## Próximos pasos
1. Completar y revisar `plantillas.tex` con comandos compartidos (formato de tablas, macros para checklist, estilos de figuras).
2. Tras rellenar cada documento, compilar el PDF y subirlo a la carpeta correspondiente.
3. Realizar una revisión ortográfica y técnica final antes de entregar.

