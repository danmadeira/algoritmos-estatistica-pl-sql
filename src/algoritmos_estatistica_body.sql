CREATE OR REPLACE PACKAGE BODY algoritmos_estatistica AS

  /*
    Média Aritmética
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION media_aritmetica (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_somatorio NUMBER := 0;
    l_media     NUMBER := 0;
    
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + p_dados(n).x;
    END LOOP;
    IF (l_num_total > 0) THEN
      l_media := l_somatorio / l_num_total;
    END IF;
    RETURN l_media;

  END media_aritmetica;

  /*
    Média Aritmética Ponderada
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION media_aritmetica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_somatorio NUMBER := 0;
    l_pesos     NUMBER := 0;
    l_media     NUMBER := 0;
    
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + (p_dados(n).w * p_dados(n).x);
      l_pesos := l_pesos + p_dados(n).w;
    END LOOP;
    IF (l_pesos > 0) THEN
      l_media := l_somatorio / l_pesos;
    END IF;
    RETURN l_media;
    
  END media_aritmetica_ponderada;

  /*
    Média Geométrica
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION media_geometrica (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total  INTEGER;
    l_produtorio NUMBER := 1;
    l_media      NUMBER := 0;
    
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_produtorio := l_produtorio * p_dados(n).x;
    END LOOP;
    IF (l_num_total > 0) THEN
      l_media := power (l_produtorio, 1 / l_num_total);
    END IF;
    RETURN l_media;
  
  END media_geometrica;

  /*
    Média Geométrica Ponderada
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION media_geometrica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_produtorio NUMBER := 1;
    l_pesos      NUMBER := 0;
    l_media      NUMBER := 0;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_produtorio := l_produtorio * power (p_dados(n).x, p_dados(n).w);
      l_pesos := l_pesos + p_dados(n).w;
    END LOOP;
    IF (l_pesos > 0) THEN
      l_media := power (l_produtorio, 1 / l_pesos);
    END IF;
    RETURN l_media;
  
  END media_geometrica_ponderada;

  /*
    Média Harmônica
    Para dados não agrupados = [x1, x2, x3, ...]
  */
  
  FUNCTION media_harmonica (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_somatorio NUMBER := 0;
    l_media     NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + (1 / p_dados(n).x);
    END LOOP;
    IF (l_somatorio != 0) THEN
      l_media := l_num_total / l_somatorio;
    END IF;
    RETURN l_media;
    
  END media_harmonica;

  /*
    Média Harmônica Ponderada
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */
  
  FUNCTION media_harmonica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_somatorio NUMBER := 0;
    l_pesos     NUMBER := 0;
    l_media     NUMBER := 0;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + (p_dados(n).w / p_dados(n).x);
      l_pesos := l_pesos + p_dados(n).w;
    END LOOP;
    IF (l_somatorio != 0) THEN
      l_media := l_pesos / l_somatorio;
    END IF;
    RETURN l_media;

  END media_harmonica_ponderada;

  /*
    Média Quadrática
    Para dados não agrupados = [x1, x2, x3, ...]
  */
  
  FUNCTION media_quadratica (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_somatorio NUMBER := 0;
    l_media     NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + power (p_dados(n).x, 2);
    END LOOP;
    IF (l_num_total > 0) THEN
      l_media := sqrt (l_somatorio / l_num_total);
    END IF;
    RETURN l_media;

  END media_quadratica;

  /*
    Média Quadrática Ponderada
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */
  
  FUNCTION media_quadratica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_somatorio NUMBER := 0;
    l_pesos     NUMBER := 0;
    l_media     NUMBER := 0;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + (p_dados(n).w * power (p_dados(n).x, 2));
      l_pesos := l_pesos + p_dados(n).w;
    END LOOP;
    IF (l_pesos > 0) THEN
      l_media := sqrt (l_somatorio / l_pesos);
    END IF;
    RETURN l_media;

  END media_quadratica_ponderada;

  /*
    Média Cúbica
    Para dados não agrupados = [x1, x2, x3, ...]
  */
  
  FUNCTION media_cubica (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_somatorio NUMBER := 0;
    l_media     NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + power (p_dados(n).x, 3);
    END LOOP;
    IF (l_num_total > 0) THEN
      l_media := power ((l_somatorio / l_num_total), 1/3);
    END IF;
    RETURN l_media;

  END media_cubica;

  /*
    Média Cúbica Ponderada
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */
  
  FUNCTION media_cubica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_somatorio NUMBER := 0;
    l_pesos     NUMBER := 0;
    l_media     NUMBER := 0;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + (p_dados(n).w * power (p_dados(n).x, 3));
      l_pesos := l_pesos + p_dados(n).w;
    END LOOP;
    IF (l_pesos > 0) THEN
      l_media := power ((l_somatorio / l_pesos), 1/3);
    END IF;
    RETURN l_media;

  END media_cubica_ponderada;

  /*
    Média Desarmônica
    Para dados não agrupados = [x1, x2, x3, ...]
  */
  
  FUNCTION media_desarmonica (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_sx        NUMBER := 0;
    l_sxi       NUMBER := 0;
    l_media     NUMBER;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_sx := l_sx + p_dados(n).x;
      l_sxi := l_sxi + (1 / p_dados(n).x);
    END LOOP;
    l_media := 2 / ((1 / (l_sx / l_num_total)) + (1 / (power (l_sx / l_num_total, 2) / (l_num_total / l_sxi))));
    RETURN l_media;

  END media_desarmonica;

  /*
    Média Desarmônica Ponderada
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */
  
  FUNCTION media_desarmonica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_spwx  NUMBER := 0;
    l_sw    NUMBER := 0;
    l_sdwx  NUMBER := 0;
    l_media NUMBER;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_spwx := l_spwx + (p_dados(n).w * p_dados(n).x);
      l_sw := l_sw + p_dados(n).w;
      l_sdwx := l_sdwx + (p_dados(n).w / p_dados(n).x);
    END LOOP;
    l_media := 2 / ((1 / (l_spwx / l_sw)) + (1 / (power (l_spwx / l_sw, 2) / (l_sw / l_sdwx))));
    RETURN l_media;

  END media_desarmonica_ponderada;
  
  /*
    Ordenar dados
    Para dados não agrupados = [x1, x2, x3, ...]
  */
  
  FUNCTION ordenar_dados (p_dados IN T_DADOS_TAB) RETURN T_DADOS_TAB
  AS
    l_dados  T_DADOS_TAB;
    l_indice PLS_INTEGER := 1;
  
  BEGIN
    FOR r_item IN (SELECT x FROM table (p_dados) ORDER BY x) LOOP
      l_dados(l_indice).x := r_item.x;
      l_indice := l_indice + 1;
    END LOOP;
    RETURN l_dados;
    
  END ordenar_dados;

  /*
    Ordenar frequências
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */
  
  FUNCTION ordenar_frequencias (p_dados IN T_DADOS_TAB, p_desc IN BOOLEAN DEFAULT true) RETURN T_DADOS_TAB
  AS
    l_dados  T_DADOS_TAB;
    l_indice PLS_INTEGER := 1;
  
  BEGIN
    IF p_desc THEN
      FOR r_item IN (SELECT w, x FROM table (p_dados) ORDER BY w DESC) LOOP
        l_dados(l_indice).w := r_item.w;
        l_dados(l_indice).x := r_item.x;
        l_indice := l_indice + 1;
      END LOOP;
    ELSE
      FOR r_item IN (SELECT w, x FROM table (p_dados) ORDER BY w ASC) LOOP
        l_dados(l_indice).w := r_item.w;
        l_dados(l_indice).x := r_item.x;
        l_indice := l_indice + 1;
      END LOOP;
    END IF;
    RETURN l_dados;
    
  END ordenar_frequencias;

  /*
    Mediana
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION mediana (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_dados     T_DADOS_TAB;
    l_num_total INTEGER;
    l_pos       INTEGER;
    l_mediana   NUMBER;
  
  BEGIN
    l_dados := ordenar_dados (p_dados);
    l_num_total := l_dados.count;
    l_pos := round (l_num_total / 2) - 1;
    IF (mod (l_num_total, 2) != 0) THEN
      l_mediana := l_dados(l_pos).x;
    ELSE
      l_mediana := (l_dados(l_pos).x + l_dados(l_pos+1).x) / 2;
    END IF;
    RETURN l_mediana;

  END mediana;

  /*
    Moda
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION moda (p_dados IN T_DADOS_TAB) RETURN T_DADOS_TAB
  AS
    l_dados  T_DADOS_TAB;
    l_moda   T_DADOS_TAB;
    l_indice PLS_INTEGER := 2;
  
  BEGIN
    l_dados := ordenar_frequencias (agrupar_dados (p_dados), true);
    IF (l_dados(1).w > 1) THEN
      l_moda(1).w := l_dados(1).w;
      l_moda(1).x := l_dados(1).x;
      FOR n IN 2 .. l_dados.last LOOP
        IF (l_dados(n).w = l_dados(n-1).w) THEN
          l_moda(l_indice).w := l_dados(n).w;
          l_moda(l_indice).x := l_dados(n).x;
          l_indice := l_indice + 1;
        ELSE
          EXIT;
        END IF;
      END LOOP;
    END IF;
    RETURN l_moda;

  END moda;

  /*
    Desvio Absoluto Médio
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION desvio_medio (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_media     NUMBER;
    l_somatorio NUMBER := 0;
    l_desvio    NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    l_media := media_aritmetica (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + abs (p_dados(n).x - l_media);
    END LOOP;
    IF (l_num_total > 0) THEN
      l_desvio := l_somatorio / l_num_total;
    END IF;
    RETURN l_desvio;

  END desvio_medio;

  /*
    Desvio Absoluto Mediano
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION desvio_mediano (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_md      NUMBER;
    l_desvios T_DADOS_TAB;
    l_indice  PLS_INTEGER := 1;
    l_desvio  NUMBER;
  
  BEGIN
    l_md := mediana (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_desvios(l_indice).x := abs(p_dados(n).x - l_md);
      l_indice := l_indice + 1;
    END LOOP;
    l_desvio := mediana (l_desvios);
    RETURN l_desvio;

  END desvio_mediano;

  /*
    Variância Populacional
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION variancia_populacional (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_media     NUMBER;
    l_somatorio NUMBER := 0;
    l_variancia NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    l_media := media_aritmetica (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + power (p_dados(n).x - l_media, 2);
    END LOOP;
    IF (l_num_total > 0) THEN
      l_variancia := l_somatorio / l_num_total;
    END IF;
    RETURN l_variancia;

  END variancia_populacional;

  /*
    Desvio Padrão Populacional
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION desvio_padrao_populacional (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_variancia NUMBER;
    l_desvio    NUMBER;
  
  BEGIN
    l_variancia := variancia_populacional (p_dados);
    l_desvio := sqrt (l_variancia);
    RETURN l_desvio;

  END desvio_padrao_populacional;

  /*
    Variância Amostral
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION variancia_amostral (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_media     NUMBER;
    l_somatorio NUMBER := 0;
    l_variancia NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    l_media := media_aritmetica (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + power (p_dados(n).x - l_media, 2);
    END LOOP;
    IF (l_num_total > 1) THEN
      l_variancia := l_somatorio / (l_num_total - 1);
    END IF;
    RETURN l_variancia;

  END variancia_amostral;

  /*
    Desvio Padrão Amostral
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION desvio_padrao_amostral (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_variancia NUMBER;
    l_desvio    NUMBER;
  
  BEGIN
    l_variancia := variancia_amostral (p_dados);
    l_desvio := sqrt (l_variancia);
    RETURN l_desvio;

  END desvio_padrao_amostral;

  /*
    Variância Populacional
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION variancia_populacional_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_media     NUMBER;
    l_somatorio NUMBER := 0;
    l_pesos     NUMBER := 0;
    l_variancia NUMBER := 0;
  
  BEGIN
    l_media := media_aritmetica_ponderada (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + (power (p_dados(n).x - l_media, 2) * p_dados(n).w);
      l_pesos := l_pesos + p_dados(n).w;
    END LOOP;
    IF (l_pesos > 0) THEN
      l_variancia := l_somatorio / l_pesos;
    END IF;
    RETURN l_variancia;

  END variancia_populacional_agrupado;

  /*
    Desvio Padrão Populacional
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION desvio_padrao_populacional_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_variancia NUMBER;
    l_desvio    NUMBER;
  
  BEGIN
    l_variancia := variancia_populacional_agrupado (p_dados);
    l_desvio := sqrt (l_variancia);
    RETURN l_desvio;

  END desvio_padrao_populacional_agrupado;

  /*
    Variância Amostral
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION variancia_amostral_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_media     NUMBER;
    l_somatorio NUMBER := 0;
    l_pesos     NUMBER := 0;
    l_variancia NUMBER := 0;
  
  BEGIN
    l_media := media_aritmetica_ponderada (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + (power (p_dados(n).x - l_media, 2) * p_dados(n).w);
      l_pesos := l_pesos + p_dados(n).w;
    END LOOP;
    IF (l_pesos > 1) THEN
      l_variancia := l_somatorio / (l_pesos - 1);
    END IF;
    RETURN l_variancia;

  END variancia_amostral_agrupado;

  /*
    Desvio Padrão Amostral
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION desvio_padrao_amostral_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_variancia NUMBER;
    l_desvio    NUMBER;
  
  BEGIN
    l_variancia := variancia_amostral_agrupado (p_dados);
    l_desvio := sqrt (l_variancia);
    RETURN l_desvio;

  END desvio_padrao_amostral_agrupado;

  /*
    Coeficiente de Variação
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION coeficiente_variacao (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_desvio NUMBER;
    l_media  NUMBER;
    l_cv     NUMBER;
  
  BEGIN
    l_desvio := desvio_padrao_populacional (p_dados);
    l_media := media_aritmetica (p_dados);
    l_cv := l_desvio / l_media * 100;
    RETURN l_cv / 100;

  END coeficiente_variacao;

  /*
    Coeficiente de Variação
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION coeficiente_variacao_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_desvio NUMBER;
    l_media  NUMBER;
    l_cv     NUMBER;
  
  BEGIN
    l_desvio := desvio_padrao_populacional_agrupado (p_dados);
    l_media := media_aritmetica_ponderada (p_dados);
    l_cv := l_desvio / l_media * 100;
    RETURN l_cv / 100;

  END coeficiente_variacao_agrupado;

  /*
    Covariância Populacional
    Para dados correlacionados = [[x1,y1], [x2,y2], [x3,y3], ...]
  */

  FUNCTION covariancia_populacional (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER
  AS
    l_num_total   NUMBER;
    l_dados_x     T_DADOS_TAB;
    l_dados_y     T_DADOS_TAB;
    l_indice      PLS_INTEGER := 1;
    l_media_x     NUMBER;
    l_media_y     NUMBER;
    l_somatorio   NUMBER := 0;
    l_covariancia NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_dados_x(l_indice).x := p_dados(n).x;
      l_dados_y(l_indice).x := p_dados(n).y;
      l_indice := l_indice + 1;
    END LOOP;
    l_media_x := media_aritmetica (l_dados_x);
    l_media_y := media_aritmetica (l_dados_y);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + ((p_dados(n).x - l_media_x) * (p_dados(n).y - l_media_y));
    END LOOP;
    IF (l_num_total > 0) THEN
      l_covariancia := l_somatorio / l_num_total;
    END IF;
    RETURN l_covariancia;

  END covariancia_populacional;

  /*
    Covariância Amostral
    Para dados correlacionados = [[x1,y1], [x2,y2], [x3,y3], ...]
  */

  FUNCTION covariancia_amostral (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER
  AS
    l_num_total   NUMBER;
    l_dados_x     T_DADOS_TAB;
    l_dados_y     T_DADOS_TAB;
    l_indice      PLS_INTEGER := 1;
    l_media_x     NUMBER;
    l_media_y     NUMBER;
    l_somatorio   NUMBER := 0;
    l_covariancia NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_dados_x(l_indice).x := p_dados(n).x;
      l_dados_y(l_indice).x := p_dados(n).y;
      l_indice := l_indice + 1;
    END LOOP;
    l_media_x := media_aritmetica (l_dados_x);
    l_media_y := media_aritmetica (l_dados_y);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + ((p_dados(n).x - l_media_x) * (p_dados(n).y - l_media_y));
    END LOOP;
    IF (l_num_total > 1) THEN
      l_covariancia := l_somatorio / (l_num_total - 1);
    END IF;
    RETURN l_covariancia;

  END covariancia_amostral;

  /*
    Coeficiente de Correlação Populacional de Pearson
    Para dados correlacionados = [[x1,y1], [x2,y2], [x3,y3], ...]
  */

  FUNCTION coeficiente_correlacao_populacional_pearson (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER
  AS
    l_dados_x     T_DADOS_TAB;
    l_dados_y     T_DADOS_TAB;
    l_indice      PLS_INTEGER := 1;
    l_covariancia NUMBER;
    l_desvio_x    NUMBER;
    l_desvio_y    NUMBER;
    l_coeficiente NUMBER;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_dados_x(l_indice).x := p_dados(n).x;
      l_dados_y(l_indice).x := p_dados(n).y;
      l_indice := l_indice + 1;
    END LOOP;
    l_covariancia := covariancia_populacional (p_dados);
    l_desvio_x := desvio_padrao_populacional (l_dados_x);
    l_desvio_y := desvio_padrao_populacional (l_dados_y);
    l_coeficiente := l_covariancia / (l_desvio_x * l_desvio_y);
    RETURN l_coeficiente;

  END coeficiente_correlacao_populacional_pearson;

  /*
    Coeficiente de Correlação Amostral de Pearson
    Para dados correlacionados = [[x1,y1], [x2,y2], [x3,y3], ...]
  */

  FUNCTION coeficiente_correlacao_amostral_pearson (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER
  AS
    l_dados_x     T_DADOS_TAB;
    l_dados_y     T_DADOS_TAB;
    l_indice      PLS_INTEGER := 1;
    l_covariancia NUMBER;
    l_desvio_x    NUMBER;
    l_desvio_y    NUMBER;
    l_coeficiente NUMBER;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_dados_x(l_indice).x := p_dados(n).x;
      l_dados_y(l_indice).x := p_dados(n).y;
      l_indice := l_indice + 1;
    END LOOP;
    l_covariancia := covariancia_amostral (p_dados);
    l_desvio_x := desvio_padrao_amostral (l_dados_x);
    l_desvio_y := desvio_padrao_amostral (l_dados_y);
    l_coeficiente := l_covariancia / (l_desvio_x * l_desvio_y);
    RETURN l_coeficiente;

  END coeficiente_correlacao_amostral_pearson;

  /*
    Somatório dos Quadrados
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION somatorio_quadrados (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_sq        NUMBER := 0;
    l_s         NUMBER := 0;
    l_somatorio NUMBER := 0;
    l_num_total INTEGER;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_sq := l_sq + power (p_dados(n).x, 2);
      l_s := l_s + p_dados(n).x;
    END LOOP;
    IF (l_num_total > 0) THEN
      l_somatorio := l_sq - (power (l_s, 2) / l_num_total);
    END IF;
    RETURN l_somatorio;

  END somatorio_quadrados;

  /*
    Somatório dos Produtos XY
    Para dados correlacionados = [[x1,y1], [x2,y2], [x3,y3], ...]
  */

  FUNCTION somatorio_produtos (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER
  AS
    l_sp        NUMBER := 0;
    l_sx        NUMBER := 0;
    l_sy        NUMBER := 0;
    l_somatorio NUMBER := 0;
    l_num_total INTEGER;
  
  BEGIN
    l_num_total := p_dados.count;
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_sp := l_sp + (p_dados(n).x * p_dados(n).y);
      l_sx := l_sx + p_dados(n).x;
      l_sy := l_sy + p_dados(n).y;
    END LOOP;
    IF (l_num_total > 0) THEN
      l_somatorio := l_sp - ((l_sx * l_sy) / l_num_total);
    END IF;
    RETURN l_somatorio;

  END somatorio_produtos;

  /*
    Coeficiente de Correlação de Pearson
    Para dados correlacionados = [[x1,y1], [x2,y2], [x3,y3], ...]
  */

  FUNCTION coeficiente_correlacao_pearson (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER
  AS
    l_dados_x     T_DADOS_TAB;
    l_dados_y     T_DADOS_TAB;
    l_sp          NUMBER;
    l_sqx         NUMBER;
    l_sqy         NUMBER;
    l_coeficiente NUMBER;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_dados_x(n).x := p_dados(n).x;
      l_dados_y(n).x := p_dados(n).y;
    END LOOP;
    l_sp := somatorio_produtos (p_dados);
    l_sqx := somatorio_quadrados (l_dados_x);
    l_sqy := somatorio_quadrados (l_dados_y);
    l_coeficiente := l_sp / sqrt (l_sqx * l_sqy);
    RETURN l_coeficiente;

  END coeficiente_correlacao_pearson;

  /*
    Z-score Populacional
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION escore_z_populacional (p_x IN NUMBER, p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_media  NUMBER;
    l_desvio NUMBER;
    l_escore NUMBER;
  
  BEGIN
    l_media := media_aritmetica (p_dados);
    l_desvio := desvio_padrao_populacional (p_dados);
    l_escore := (p_x - l_media) / l_desvio;
    RETURN l_escore;

  END escore_z_populacional;

  /*
    Z-score Amostral
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION escore_z_amostral (p_x IN NUMBER, p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_media  NUMBER;
    l_desvio NUMBER;
    l_escore NUMBER;
  
  BEGIN
    l_media := media_aritmetica (p_dados);
    l_desvio := desvio_padrao_amostral (p_dados);
    l_escore := (p_x - l_media) / l_desvio;
    RETURN l_escore;

  END escore_z_amostral;

  /*
    Três Desvios
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION tres_desvios (p_dados IN T_DADOS_TAB, p_pop IN BOOLEAN DEFAULT true) RETURN T_NUM_BY_CHAR_TAB
  AS
    l_media       NUMBER;
    l_desvio      NUMBER;
    l_tresdesvios T_NUM_BY_CHAR_TAB;
  
  BEGIN
    l_media := media_aritmetica (p_dados);
    IF p_pop THEN
      l_desvio := desvio_padrao_populacional (p_dados);
    ELSE
      l_desvio := desvio_padrao_amostral (p_dados);
    END IF;
    l_tresdesvios('-3') := l_media - (3 * l_desvio);
    l_tresdesvios('-2') := l_media - (2 * l_desvio);
    l_tresdesvios('-1') := l_media - l_desvio;
    l_tresdesvios('+1') := l_media + l_desvio;
    l_tresdesvios('+2') := l_media + (2 * l_desvio);
    l_tresdesvios('+3') := l_media + (3 * l_desvio);
    RETURN l_tresdesvios;

  END tres_desvios;

  /*
    Amplitude
    Para dados não agrupados = [x1, x2, x3, ...]
    ou agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION amplitude (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_dados     T_DADOS_TAB;
    l_primeiro  PLS_INTEGER;
    l_ultimo    PLS_INTEGER;
    l_amplitude NUMBER;
  
  BEGIN
    IF p_dados(1).w IS NOT NULL THEN
      l_dados := ordenar_dados (desagrupar_dados (p_dados));
    ELSE
      l_dados := ordenar_dados (p_dados);
    END IF;
    l_primeiro := l_dados.first;
    l_ultimo := l_dados.last;
    l_amplitude := l_dados(l_ultimo).x - l_dados(l_primeiro).x;
    RETURN l_amplitude;

  END amplitude;

  /*
    Assimetria
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION assimetria (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total  INTEGER;
    l_media      NUMBER;
    l_desvio     NUMBER;
    l_somatorio  NUMBER := 0;
    l_assimetria NUMBER := 0;
  
  BEGIN
    l_num_total := p_dados.count;
    l_media := media_aritmetica (p_dados);
    l_desvio := desvio_padrao_amostral (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + power ((p_dados(n).x - l_media) / l_desvio, 3);
    END LOOP;
    IF (l_num_total > 0) THEN
      l_assimetria := l_somatorio / l_num_total;
    END IF;
    RETURN l_assimetria;

  END assimetria;

  /*
    Curtose
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION curtose (p_dados IN T_DADOS_TAB) RETURN NUMBER
  AS
    l_num_total INTEGER;
    l_media     NUMBER;
    l_desvio    NUMBER;
    l_somatorio NUMBER := 0;
    l_curtose   NUMBER;
  
  BEGIN
    l_num_total := p_dados.count;
    l_media := media_aritmetica (p_dados);
    l_desvio := desvio_padrao_amostral (p_dados);
    FOR n IN p_dados.first .. p_dados.last LOOP
      l_somatorio := l_somatorio + power ((p_dados(n).x - l_media) / l_desvio, 4);
    END LOOP;
    l_curtose := (l_somatorio / l_num_total) - 3;
    RETURN l_curtose;

  END curtose;

  /*
    Quartis
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION quartis (p_dados IN T_DADOS_TAB) RETURN T_NUM_BY_INT_TAB
  AS
    l_dados     T_DADOS_TAB;
    l_num_total INTEGER;
    l_k         NUMBER;
    l_i         INTEGER;
    l_quartil   NUMBER;
    l_quartis   T_NUM_BY_INT_TAB;
  
  BEGIN
    l_dados := ordenar_dados (p_dados);
    l_num_total := l_dados.count;
    FOR j IN 1 .. 3 LOOP
      l_k := (j * (l_num_total + 1)) / 4;
      l_i := floor (l_k);
      l_quartil := l_dados(l_i).x + ((l_k - l_i) * (l_dados(l_i+1).x - l_dados(l_i).x));
      l_quartis(j) := l_quartil;
    END LOOP;
    RETURN l_quartis;

  END quartis;

  /*
    Desagrupar dados
    Para dados agrupados = [[w1,x1], [w2,x2], [w3,x3], ...]
  */

  FUNCTION desagrupar_dados (p_dados IN T_DADOS_TAB) RETURN T_DADOS_TAB
  AS
    l_dadosdesagrupados T_DADOS_TAB;
    l_indice            PLS_INTEGER := 1;
  
  BEGIN
    FOR n IN p_dados.first .. p_dados.last LOOP
      FOR p IN 1 .. p_dados(n).w LOOP
        l_dadosdesagrupados(l_indice).x := p_dados(n).x;
        l_indice := l_indice + 1;
      END LOOP;
    END LOOP;
    RETURN l_dadosdesagrupados;

  END desagrupar_dados;

  /*
    Agrupar dados
    Para dados não agrupados = [x1, x2, x3, ...]
  */

  FUNCTION agrupar_dados (p_dados IN T_DADOS_TAB) RETURN T_DADOS_TAB
  AS
    l_dados          T_DADOS_TAB;
    l_num_total      INTEGER;
    l_indice         PLS_INTEGER := 1;
    l_x              NUMBER;
    l_w              NUMBER;
    l_proximo        NUMBER;
    l_dadosagrupados T_DADOS_TAB;
  
  BEGIN
    l_dados := ordenar_dados (p_dados);
    l_num_total := l_dados.count;
    WHILE (l_indice <= l_num_total) LOOP
      l_x := p_dados(l_indice).x;
      l_w := 1;
      l_proximo := l_indice + 1;
      WHILE (l_proximo <= l_num_total) LOOP
        IF (p_dados(l_indice).x = p_dados(l_proximo).x) THEN
          l_w := l_w + 1;
          l_proximo := l_proximo + 1;
        ELSE
          EXIT;
        END IF;
      END LOOP;
      l_dadosagrupados(l_indice).w := l_w;
      l_dadosagrupados(l_indice).x := l_x;
      l_indice := l_proximo;
    END LOOP;
    RETURN l_dadosagrupados;

  END agrupar_dados;

END algoritmos_estatistica;
/
