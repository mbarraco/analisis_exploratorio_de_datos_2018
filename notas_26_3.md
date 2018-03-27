# Notas 26 de Marzo

## Briefing from last class
*  Commands: rbind, cbind, solve

# Estadística descriptiva

* Estadísticos de resumen
    * Posición
    * Escala

* Salidas gráficas

## Estadísticos de posición
* Media: usa explícitamente todos los daos
* Mediana: no lo hace, explicitamente (ej. agrandar el elemento más grande de todos no me cambia la mediana).
* Media alpha-podada: donde alpha<0.5 implica cortar el 0.5 de los datos a cada extremo de la muestra.

## Estadísticos de escala
* Desviación estándar: ```\alpha ```
* Rango:
    ```math
    X_n - X_1
    ```
* IQR (rango intercuartil):
    ```math
    X_[n*3/4] - X_[n/4]
    ```
    ```bash
    command: iqr
    ```
**obs: tiene un punto de ruptura de 25%
**obs: por encima del primer cuartil està el 75% de los datos.
* MAD (median absolut deviation). Tiene un punto de ruptura edl 50%, no es fácil de ver.
    ```math
    mad = mediana(|X_i - mediana(X)|)
    ```

## Salidas gráficas

* Histograma
    ```bash
    command: hist
    ```

* Boxplot: calcula sucesivamente: mediana, primer cuartil, tercer cuartil.
    * Bigotes (whiskers): el valor más grande que cae en el intervalo [tercer cuartil - 1.5 * tercer cuartil].
    Al resto de los valores los dibuja como estrellas sobre el "box and whisker".\
    obs:X_n - X_1
* qqplot: se usa para evaluar la bondad de ajuste. Ej.: ver si una población dada se ajusta a una distribución dada.
    * Idea/ejemplo: quiero ver si un set de datos X pertenece a la distro F.
        1. Calculo los percentiles teóricos Z: z_1 ... z_n
        2. Grafico los datos X vs Z y veo qué tan parecida a una recta ¿en qué sentido?
    * obs: puedo escribir cualquier normal como N(0,1), pues:
    ```bash
    command: qqnorm
    ```