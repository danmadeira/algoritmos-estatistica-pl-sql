CREATE OR REPLACE PACKAGE algoritmos_estatistica AS

  TYPE t_pesos_e_medidas_estatisticas_rec IS RECORD ( w NUMBER, x NUMBER );
  TYPE t_dados_tab IS TABLE OF t_pesos_e_medidas_estatisticas_rec INDEX BY PLS_INTEGER;

  TYPE t_medidas_correlacionadas_rec IS RECORD ( x NUMBER, y NUMBER );
  TYPE t_dados_corr_tab IS TABLE OF t_medidas_correlacionadas_rec INDEX BY PLS_INTEGER;
  
  TYPE t_num_by_char_tab IS TABLE OF NUMBER INDEX BY VARCHAR2(2);
  
  TYPE t_num_by_int_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;

  FUNCTION media_aritmetica (p_dados IN T_DADOS_TAB) RETURN NUMBER;

  FUNCTION media_aritmetica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_geometrica (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_geometrica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_harmonica (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_harmonica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_quadratica (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_quadratica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_cubica (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_cubica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_desarmonica (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION media_desarmonica_ponderada (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION mediana (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION moda (p_dados IN T_DADOS_TAB) RETURN T_DADOS_TAB;
  
  FUNCTION desvio_medio (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION desvio_mediano (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION variancia_populacional (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION desvio_padrao_populacional (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION variancia_amostral (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION desvio_padrao_amostral (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION variancia_populacional_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION desvio_padrao_populacional_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION variancia_amostral_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION desvio_padrao_amostral_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION coeficiente_variacao (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION coeficiente_variacao_agrupado (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION covariancia_populacional (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER;
  
  FUNCTION covariancia_amostral (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER;
  
  FUNCTION coeficiente_correlacao_populacional_pearson (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER;
  
  FUNCTION coeficiente_correlacao_amostral_pearson (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER;
  
  FUNCTION somatorio_quadrados (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION somatorio_produtos (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER;
  
  FUNCTION coeficiente_correlacao_pearson (p_dados IN T_DADOS_CORR_TAB) RETURN NUMBER;
  
  FUNCTION escore_z_populacional (p_x IN NUMBER, p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION escore_z_amostral (p_x IN NUMBER, p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION tres_desvios (p_dados IN T_DADOS_TAB, p_pop IN BOOLEAN DEFAULT true) RETURN T_NUM_BY_CHAR_TAB;
  
  FUNCTION amplitude (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION assimetria (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION curtose (p_dados IN T_DADOS_TAB) RETURN NUMBER;
  
  FUNCTION quartis (p_dados IN T_DADOS_TAB) RETURN T_NUM_BY_INT_TAB;
  
  FUNCTION desagrupar_dados (p_dados IN T_DADOS_TAB) RETURN T_DADOS_TAB;
  
  FUNCTION agrupar_dados (p_dados IN T_DADOS_TAB) RETURN T_DADOS_TAB;
  
END algoritmos_estatistica;
/
