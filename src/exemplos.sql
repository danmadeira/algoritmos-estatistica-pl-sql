DECLARE
  l_dados_nao_agrupados   ALGORITMOS_ESTATISTICA.T_DADOS_TAB;
  l_dados_agrupados       ALGORITMOS_ESTATISTICA.T_DADOS_TAB;
  l_dados_correlacionados ALGORITMOS_ESTATISTICA.T_DADOS_CORR_TAB;
  l_x                     NUMBER := 2;
  
  l_moda                  ALGORITMOS_ESTATISTICA.T_DADOS_TAB;
  l_tresdesvios           ALGORITMOS_ESTATISTICA.T_NUM_BY_CHAR_TAB;
  l_quartis               ALGORITMOS_ESTATISTICA.T_NUM_BY_INT_TAB;

BEGIN
  l_dados_nao_agrupados(1).x := 1;
  l_dados_nao_agrupados(2).x := 2;
  l_dados_nao_agrupados(3).x := 2;
  l_dados_nao_agrupados(4).x := 3;
  l_dados_nao_agrupados(5).x := 3;
  l_dados_nao_agrupados(6).x := 5;
  l_dados_nao_agrupados(7).x := 6;
  l_dados_nao_agrupados(8).x := 6;
  l_dados_nao_agrupados(9).x := 6;
  l_dados_nao_agrupados(10).x := 6;
  l_dados_nao_agrupados(11).x := 7;
  l_dados_nao_agrupados(12).x := 8;
  l_dados_nao_agrupados(13).x := 8;
  l_dados_nao_agrupados(14).x := 8;
  l_dados_nao_agrupados(15).x := 9;

  l_dados_agrupados(1).w := 1;
  l_dados_agrupados(1).x := 1;
  l_dados_agrupados(2).w := 2;
  l_dados_agrupados(2).x := 2;
  l_dados_agrupados(3).w := 2;
  l_dados_agrupados(3).x := 3;
  l_dados_agrupados(4).w := 1;
  l_dados_agrupados(4).x := 5;
  l_dados_agrupados(5).w := 4;
  l_dados_agrupados(5).x := 6;
  l_dados_agrupados(6).w := 1;
  l_dados_agrupados(6).x := 7;
  l_dados_agrupados(7).w := 3;
  l_dados_agrupados(7).x := 8;
  l_dados_agrupados(8).w := 1;
  l_dados_agrupados(8).x := 9;
  
  l_dados_correlacionados(1).x := 1;
  l_dados_correlacionados(1).y := 9;
  l_dados_correlacionados(2).x := 2;
  l_dados_correlacionados(2).y := 10;
  l_dados_correlacionados(3).x := 3;
  l_dados_correlacionados(3).y := 11;
  l_dados_correlacionados(4).x := 4;
  l_dados_correlacionados(4).y := 12;
  l_dados_correlacionados(5).x := 5;
  l_dados_correlacionados(5).y := 13;
  l_dados_correlacionados(6).x := 6;
  l_dados_correlacionados(6).y := 14;
  l_dados_correlacionados(7).x := 7;
  l_dados_correlacionados(7).y := 15;
  l_dados_correlacionados(8).x := 8;
  l_dados_correlacionados(8).y := 16;
  

  DBMS_OUTPUT.put_line ('Média Aritmética: ' || ALGORITMOS_ESTATISTICA.media_aritmetica (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Média Aritmética Ponderada: ' || ALGORITMOS_ESTATISTICA.media_aritmetica_ponderada (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Média Geométrica: ' || ALGORITMOS_ESTATISTICA.media_geometrica (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Média Geométrica Ponderada: ' || ALGORITMOS_ESTATISTICA.media_geometrica_ponderada (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Média Harmônica: ' || ALGORITMOS_ESTATISTICA.media_harmonica (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Média Harmônica Ponderada: ' || ALGORITMOS_ESTATISTICA.media_harmonica_ponderada (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Média Quadrática: ' || ALGORITMOS_ESTATISTICA.media_quadratica (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Média Quadrática Ponderada: ' || ALGORITMOS_ESTATISTICA.media_quadratica_ponderada (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Média Cúbica: ' || ALGORITMOS_ESTATISTICA.media_cubica (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Média Cúbica Ponderada: ' || ALGORITMOS_ESTATISTICA.media_cubica_ponderada (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Média Desarmônica: ' || ALGORITMOS_ESTATISTICA.media_desarmonica (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Média Desarmônica Ponderada: ' || ALGORITMOS_ESTATISTICA.media_desarmonica_ponderada (l_dados_agrupados));
  
  l_moda := ALGORITMOS_ESTATISTICA.moda (l_dados_nao_agrupados);
--  FOR r_item IN (SELECT * FROM table (l_moda)) LOOP
--    DBMS_OUTPUT.put_line ('Moda: ' || r_item.x);
--  END LOOP;
  FOR n IN l_moda.first .. l_moda.last LOOP
    DBMS_OUTPUT.put_line ('Moda: ' || to_char(l_moda(n).x));
  END LOOP;
  
  DBMS_OUTPUT.put_line ('Mediana: ' || ALGORITMOS_ESTATISTICA.mediana (l_dados_nao_agrupados));
  
  DBMS_OUTPUT.put_line ('Desvio Absoluto Médio: ' || ALGORITMOS_ESTATISTICA.desvio_medio (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Desvio Absoluto Mediano: ' || ALGORITMOS_ESTATISTICA.desvio_mediano (l_dados_nao_agrupados));
  
  DBMS_OUTPUT.put_line ('Variância Populacional: ' || ALGORITMOS_ESTATISTICA.variancia_populacional (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Desvio Padrão Populacional: ' || ALGORITMOS_ESTATISTICA.desvio_padrao_populacional (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Variância Amostral: ' || ALGORITMOS_ESTATISTICA.variancia_amostral (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Desvio Padrão Amostral: ' || ALGORITMOS_ESTATISTICA.desvio_padrao_amostral (l_dados_nao_agrupados));
  
  DBMS_OUTPUT.put_line ('Variância Populacional (agrupado): ' || ALGORITMOS_ESTATISTICA.variancia_populacional_agrupado (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Desvio Padrão Populacional (agrupado): ' || ALGORITMOS_ESTATISTICA.desvio_padrao_populacional_agrupado (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Variância Amostral (agrupado): ' || ALGORITMOS_ESTATISTICA.variancia_amostral_agrupado (l_dados_agrupados));
  DBMS_OUTPUT.put_line ('Desvio Padrão Amostral (agrupado): ' || ALGORITMOS_ESTATISTICA.desvio_padrao_amostral_agrupado (l_dados_agrupados));
  
  DBMS_OUTPUT.put_line ('Coeficiente de Variação: ' || ALGORITMOS_ESTATISTICA.coeficiente_variacao (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Coeficiente de Variação (agrupado): ' || ALGORITMOS_ESTATISTICA.coeficiente_variacao_agrupado (l_dados_agrupados));
  
  DBMS_OUTPUT.put_line ('Covariância Populacional: ' || ALGORITMOS_ESTATISTICA.covariancia_populacional (l_dados_correlacionados));
  DBMS_OUTPUT.put_line ('Covariância Amostral: ' || ALGORITMOS_ESTATISTICA.covariancia_amostral (l_dados_correlacionados));
  
  DBMS_OUTPUT.put_line ('Coeficiente de Correlação Populacional de Pearson: ' || ALGORITMOS_ESTATISTICA.coeficiente_correlacao_populacional_pearson (l_dados_correlacionados));
  DBMS_OUTPUT.put_line ('Coeficiente de Correlação Amostral de Pearson: ' || ALGORITMOS_ESTATISTICA.coeficiente_correlacao_amostral_pearson (l_dados_correlacionados));
  
  DBMS_OUTPUT.put_line ('Somatório dos Quadrados: ' || ALGORITMOS_ESTATISTICA.somatorio_quadrados (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Somatório dos Produtos XY: ' || ALGORITMOS_ESTATISTICA.somatorio_produtos (l_dados_correlacionados));
  
  DBMS_OUTPUT.put_line ('Coeficiente de Correlação de Pearson: ' || ALGORITMOS_ESTATISTICA.coeficiente_correlacao_pearson (l_dados_correlacionados));
  DBMS_OUTPUT.put_line ('Z-score Populacional: ' || ALGORITMOS_ESTATISTICA.escore_z_populacional (l_x, l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Z-score Amostral: ' || ALGORITMOS_ESTATISTICA.escore_z_amostral (l_x, l_dados_nao_agrupados));
  
  l_tresdesvios := ALGORITMOS_ESTATISTICA.tres_desvios (l_dados_nao_agrupados, true);
  DBMS_OUTPUT.put_line ('Três Desvios: -3 ' || l_tresdesvios('-3') || ' -2 ' || l_tresdesvios('-2') || ' -1 ' || l_tresdesvios('-1') || ' +1 ' || l_tresdesvios('+1') || ' +2 ' || l_tresdesvios('+2') || ' +3 ' || l_tresdesvios('+3'));
  
  DBMS_OUTPUT.put_line ('Amplitude (dados não agrupados): ' || ALGORITMOS_ESTATISTICA.amplitude (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Amplitude (dados agrupados): ' || ALGORITMOS_ESTATISTICA.amplitude (l_dados_agrupados));
  
  DBMS_OUTPUT.put_line ('Assimetria: ' || ALGORITMOS_ESTATISTICA.assimetria (l_dados_nao_agrupados));
  DBMS_OUTPUT.put_line ('Curtose: ' || ALGORITMOS_ESTATISTICA.curtose (l_dados_nao_agrupados));
  
  l_quartis := ALGORITMOS_ESTATISTICA.quartis (l_dados_nao_agrupados);
  DBMS_OUTPUT.put_line ('Quartis: ' || l_quartis(1) || ' ' || l_quartis(2) || ' ' || l_quartis(3));
  
END;
