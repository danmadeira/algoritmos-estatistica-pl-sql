## Demonstração de Algoritmos de Estatística em PL/SQL

Esta é uma demonstração de funções que implementam alguns cálculos estatísticos. Os algoritmos que representam as fórmulas estatísticas estão escritos em uma estrutura simples e semelhante a aplicação pura das respectivas fórmulas, para deixar o código o mais limpo possível, e assim, didático.

Até o momento, estas são algumas das fórmulas estatísticas que estão presentes:

* Média Aritmética
## $$\\mu = \\frac{1}{n} \\sum_{i=1}^{n} x_i$$

* Média Aritmética Ponderada
## $$\\mu_p = \\frac{1}{\\sum_{i=1}^{n} w_i} \\sum_{i=1}^{n} w_i x_i$$

* Média Geométrica
## $$\\mu_g = \\sqrt[n]{\\prod_{i=1}^{n} x_i}$$

* Média Geométrica Ponderada
## $$\\mu_{gp} = \\sqrt[\\sum_{i=1}^{n} w_i]{\\prod_{i=1}^{n} {x_i}^{w_i}}$$

* Média Harmônica
### $$\\mu_h = \\frac{n}{\\sum_{i=1}^{n} \\frac{1}{x_i}}$$

* Média Harmônica Ponderada
### $$\\mu_{hp} = \\frac{\\sum_{i=1}^{n} w_i}{\\sum_{i=1}^{n} \\frac{w_i}{x_i}}$$

* Média Quadrática
### $$\\mu_q = \\sqrt{\\frac{1}{n} \\sum_{i=1}^{n} {x_i}^2}$$

* Média Quadrática Ponderada
### $$\\mu_{qp} = \\sqrt{\\frac{1}{\\sum_{i=1}^{n} w_i} \\sum_{i=1}^{n} w_i{x_i}^2}$$

* Média Cúbica
### $$\\mu_c = \\sqrt[3]{\\frac{1}{n} \\sum_{i=1}^{n} {x_i}^3}$$

* Média Cúbica Ponderada
### $$\\mu_{cp} = \\sqrt[3]{\\frac{1}{\\sum_{i=1}^{n} w_i} \\sum_{i=1}^{n} w_i {x_i}^3}$$

* Média Desarmônica
### $$\\mu_d = \\frac{2}{\\frac{1}{\\frac{\\sum_{i=1}^{n} x_i}{n}} + \\frac{1}{\\frac{{\\bigl(\\frac{\\sum_{i=1}^{n} x_i}{n}\\bigl)}^2}{\\frac{n}{\\sum_{i=1}^{n} \\frac{1}{x_i}}}}}$$

* Média Desarmônica Ponderada
### $$\\mu_{dp} = \\frac{2}{\\frac{1}{\\frac{\\sum_{i=1}^{n} w_i x_i}{\\sum_{i=1}^{n} w_i}} + \\frac{1}{\\frac{{\\Bigl(\\frac{\\sum_{i=1}^{n} w_i x_i}{\\sum_{i=1}^{n} w_i}\\Bigl)}^2}{\\frac{\\sum_{i=1}^{n} w_i}{\\sum_{i=1}^{n} \\frac{w_i}{x_i}}}}}$$

* Mediana

* Moda

* Desvio Absoluto Médio
### $$D_{am} = \\frac{1}{n} \\sum_{i=1}^{n} |x_i - \\mu|$$

* Desvio Absoluto Mediano
### $$D_{am} = Md(|x_i - \\tilde{x}|)$$

* Variância Populacional
### $$\\sigma^2 = \\frac{1}{n} \\sum_{i=1}^{n} (x_i - \\mu)^2$$

* Desvio Padrão Populacional
### $$\\sigma = \\sqrt{\\frac{1}{n} \\sum_{i=1}^{n} (x_i - \\mu)^2}$$

* Variância Amostral
### $$s^2 = \\frac{1}{n-1} \\sum_{i=1}^{n} (x_i - \\bar{x})^2$$

* Desvio Padrão Amostral
### $$s = \\sqrt{\\frac{1}{n-1} \\sum_{i=1}^{n} (x_i - \\bar{x})^2}$$

* Variância Populacional (para dados agrupados)
### $$\\sigma^2 = \\frac{1}{\\sum_{i=1}^{n} w_i} \\sum_{i=1}^{n} \\bigl((x_i - \\mu)^2 w_i\\bigl)$$

* Desvio Padrão Populacional (para dados agrupados)
### $$\\sigma = \\sqrt{\\frac{1}{\\sum_{i=1}^{n} w_i} \\sum_{i=1}^{n} \\bigl((x_i - \\mu)^2 w_i\\bigl)}$$

* Variância Amostral (para dados agrupados)
### $$s^2 = \\frac{1}{\\sum_{i=1}^{n} w_i - 1} \\sum_{i=1}^{n} \\bigl((x_i - \\bar{x})^2 w_i\\bigl)$$

* Desvio Padrão Amostral (para dados agrupados)
### $$s = \\sqrt{\\frac{1}{\\sum_{i=1}^{n} w_i - 1} \\sum_{i=1}^{n} \\bigl((x_i - \\bar{x})^2 w_i\\bigl)}$$

* Coeficiente de Variação
### $$CV = \\frac{\\sigma}{\\mu} \\times 100$$

* Coeficiente de Variação (para dados agrupados)
### $$CV = \\frac{\\sigma}{\\mu} \\times 100$$

* Covariância Populacional
### $$\\sigma_{xy} = \\frac{1}{n} \\sum_{i=1}^{n} (x_i - \\mu_x)(y_i - \\mu_y)$$

* Covariância Amostral
### $$s_{xy} = \\frac{1}{n-1} \\sum_{i=1}^{n} (x_i - \\bar{x})(y_i - \\bar{y})$$

* Coeficiente de Correlação Populacional de Pearson
### $$\\rho_{xy} = \\frac{\\sigma_{xy}}{\\sigma_x \\sigma_y}$$

* Coeficiente de Correlação Amostral de Pearson
### $$r_{xy} = \\frac{s_{xy}}{s_x s_y}$$

* Somatório dos Quadrados
### $$SS_x = \\sum_{i=1}^{n} {x_i}^2 - \\frac{(\\sum_{i=1}^{n} x_i)^2}{n}$$

* Somatório dos Produtos XY
### $$SS_{xy} = \\sum_{i=1}^{n} x_i y_i - \\frac{(\\sum_{i=1}^{n} x_i)(\\sum_{i=1}^{n} y_i)}{n}$$

* Coeficiente de Correlação de Pearson
### $$r = \\frac{SS_{xy}}{\\sqrt{SS_x \\times SS_y}}$$

* Z-score Populacional
### $$z = \\frac{x - \\mu}{\\sigma}$$

* Z-score Amostral
### $$z = \\frac{x - \\bar{x}}{s}$$

* Três Desvios

* Amplitude

* Assimetria
### $$A = \\frac{1}{n} \\sum_{i=1}^{n} \\Bigl(\\frac{x_i - \\bar{x}}{s}\\Bigl)^3$$

* Curtose
### $$K = \\frac{1}{n} \\sum_{i=1}^{n} \\Bigl(\\frac{x_i - \\bar{x}}{s}\\Bigl)^4 - 3$$

* Quartis
### $$i = \\frac{j(n+1)}{4}$$
### $$Q_j = x_i + \\biggl(\\frac{j(n+1)}{4} - i\\biggl) (x_{i+1} - x_i)$$
*para j = 1, 2 e 3*

Além de funções para:

* Desagrupar dados
* Agrupar dados
* Ordenar dados
* Ordenar frequências

Obs.: As funções possuem versões para dados agrupados ou não agrupados e para dados amostrais ou populacionais. Há também um script de exemplo, com demonstrações das chamadas das funções.

### Referências:

- AGRESTI, A.; FRANKLIN, C.; KLINGENBERG, B. *Statistics: The Art and Science of Learning from Data*, 4th Edition. Pearson Education Limited, 2018.

- ANDERSON, D. R.; SWEENEY, D. J.; WILLIAMS, T. A. *Essentials of Statistics for Business and Economics*, 5th Edition. Thomson South-Western, 2009.

- ANDERSON, D. R.; SWEENEY, D. J.; WILLIAMS, T. A. *Statistics for Business and Economics*, 11th Edition. South-Western, Cengage Learning, 2011.

- BALES, D. J. *Beginning Oracle PL/SQL*, 2nd Edition. Apress, 2015.

- BLUMAN, A. G. *Elementary Statistics: A Step By Step Approach*, 10th Edition. McGraw-Hill, 2018.

- BONAMENTE, M. *Statistics and Analysis of Scientific Data*, 2nd Edition. Springer Science Business Media, 2017.

- BOSLAUGH, S.; WATTERS, P. A. *Statistics in a Nutshell*, 1st Edition. O'Reilly, 2008.

- BRUCE, P.; BRUCE, A.; GEDECK, P. *Practical Statistics for Data Scientists*, 2nd Edition. O'Reilly Media, 2020.

- DANGETI, P. *Statistics for Machine Learning*. Packt Publishing, 2017.

- DEVORE, J. L. *Probability and Statistics for Engineering and the Sciences*, 9th Edition. Cengage Learning, 2016.

- EMC Education Services. *Data Science & Big Data Analytics: Discovering, Analyzing, Visualizing and Presenting Data*. John Wiley & Sons, 2015.

- FORSYTH, D. *Probability and Statistics for Computer Science*. Springer International Publishing, 2018.

- FREEDMAN, D.; PISANI, R.; PURVES. R. *Statistics*, 4th Edition. W. W. Norton & Company, 2007.

- FREUND, R. J.; WILSON, W. J. *Statistical Methods*, 2nd Edition. Academic Press, 2003.

- HEUMANN, C.; SCHOMAKER, M.; SHALABH. *Introduction to Statistics and Data Analysis*. Springer International Publishing Switzerland, 2016.

- HOGG, R. V.; MCKEAN, J. W.; CRAIG, A. T. *Introduction to Mathematical Statistics*, 8th Edition. Pearson Education, 2019.

- HUBER, P. J.; RONCHETTI, E. M. *Robust Statistics*, Second Edition. John Wiley & Sons, 2009.

- JOHNSON, R.; KUBY, P. *Elementary Statistics*, 11th edition. Brooks/Cole, Cengage Learning, 2012.

- KOTZ, S.; READ, C. B.; BALAKRISHNAN, N.; VIDAKOVIC, B. *Encyclopedia of Statistical Sciences*, 2nd Edition, Vol 1-16. John Wiley & Sons, 2005.

- MARTIN, B. R. *Statistics for Physical Sciences, An Introduction*, 1st Edition. Elsevier, 2012.

- MCDONALD, C. et col. *Mastering Oracle PL/SQL: Practical Solutions*. APress Media, LLC, 2004.

- MENDENHALL, W.; BEAVER, R. J.; BEAVER, B. M. *Introduction to Probability and Statistics*, 13th Edition. Brooks/Cole, Cengage Learning, 2009.

- MENDENHALL, W. M.; SINCICH, T. L. *Statistics for Engineering and the Sciences*, 6th Edition. CRC Press, Taylor & Francis Group, 2016.

- MONTGOMERY, D. C.; RUNGER, G. C. *Applied Statistics and Probability for Engineers*, 3rd Edition. John Wiley & Sons, 2003.

- MORIN, L. *Oracle Database Database PL/SQL Language Reference, 19c*. E96448-03, Oracle, August 2020.

- MURACH, J. *Murach's Oracle SQL and PL/SQL for Developers*, 2nd Edition. Mike Murach & Associates, 2014.

- NISBET, R.; MINER, G.; YALE, K. *Handbook of Statistical Analysis and Data Mining Applications*, 2nd Edition. Academic Press, Elsevier, 2018.

- OZDEMIR, S. *Principles of Data Science: Learn the techniques and math you need to start making sense of your data*. Packt Publishing, 2016.

- PECK, R.; DEVORE, J. L. *Statistics: The Exploration and Analysis of Data*, 7th Edition. Brooks/Cole, Cengage Learning, 2012.

- PECK, R.; OLSEN, C.; DEVORE, J. L. *Introduction to Statistics and Data Analysis*, 4th Edition. Brooks/Cole, Cengage Learning, 2012.

- PROVOST, F.; FAWCETT, T. *Data Science for Business*, 1st Edition. O'Reilly Media, 2013.

- RASCH, D.; SCHOTT, D. *Mathematical Statistics*. John Wiley & Sons, 2018.

- ROSENZWEIG, B.; RAKHIMOV, E. S. *Oracle PL/SQL by example*, 4th Edition. Pearson Education, Inc., 2009.

- RUPPERT, D.; MATTESON, D. S. *Statistics and Data Analysis for Financial Engineering with R examples*, Second Edition. Springer Texts in Statistics. Springer, 2015.

- SALKIND, N. J. *Encyclopedia of Measurement and Statistics*, Vol 1-3. SAGE Publications, 2007.

- SKIENA, S. S. *The Data Science Design Manual*. Texts in Computer Science. Springer International Publishing, 2017.

- SPIEGEL, M. R.; STEPHENS, L. J. *Schaum's Outline of Statistics*, 6th Edition. McGraw-Hill Education, 2018.

- WALPOLE, R. E.; MYERS, R. H.; MYERS, S. L.; YE, K. *Probability & Statistics for Engineers & Scientists*, 9th Edition, Global Edition. Pearson Education Limited, 2016.

- WEIERS, R. M. *Introduction to Business Statistics*, 6th Edition. Thomson South-Western, 2008.

- WITTE, R. S.; WITTE, J. S. *Statistics*, 11th Edition. John Wiley & Sons, 2017.
