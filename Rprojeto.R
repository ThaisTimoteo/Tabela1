library(dplyr)

iris_tbl <- as_tibble(iris)
iris_tbl

select(iris_tbl, -Sepal.Length, -Species)

filter(iris_tbl, Sepal.Length > 3.5)

iris_tbl %>%
  filter(Sepal.Length > 3.5) %>%
    select(Sepal.Length, Species)

iris_tbl %>%
  filter(Sepal.Length > 3.5, Species == "setosa") 

#mutate = transforma a tabela, adicionando e removendo linhas/colunas# ----


iris_tbl %>%
mutate (Sepal = Sepal.Length * 2)

#transmute = 'destroi' a coluna, desfazendo as colunas não selecionadas#

iris_tbl %>%
    transmute(Sepal.Length = Sepal.Lenght * 2, Species)

#Summarise#
#group_by = agrupa com  a coluna selecionada#
#A virgula adiciona o comando 'e'#

iris_tbl %>%
  group_by(Species) %>%
  summarise(
    media_petala = mean(Petal.Length),
    mediana_petala = median(Petal.Length)
    )

iris_tbl %>%
  filter(Sepal.Length >= 3, Petal.Length < 1.7) %>%
  group_by(Species)



#graficos de dispersão (ggplot2)# ----
#aes = aesthetic, design#
#geom#
#color#

library (ggplot2)
 
iris_tbl <- as_tibble(iris)        
ggplot (iris_tbl) + 
  aes(x = Petal.Length,
      y = Petal.Width, 
      color = Species) +
  geom_point (alpha = 0.6) +
  xlab("Tamanho da Pétala") +
  ylab ("Largura da Pétala") +
  ggtitle ("Gráfico de dispersão") +
 theme (plot.title = element_text(hjust = 0.5))


#graficos de boxplot# ----
ggplot (iris_tbl) +
  aes (y = Petal.Length, group = Species) + 
  geom_boxplot()

#graficos de linha# ----
library(tidyquant)
library (ggplot2)

ggplot(tq_get(c("PETR4.SA", "BBAS3.SA")) +
aes(x = date,y = close, color = symbol) +
geom_line()