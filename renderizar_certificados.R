## Script para renderizar os certificados ##


# cria-se uma funcao com o pacote purrr.
# A variavel V1 abaixo é a coluna onde estao os nomes.
# Pode-se indicar outros dados como indice.

library(purrr)

render_nomes<-function(V1){
  template <- "parametros.Rmd"  # template previamente criado rm Rmarkdown
  outfile <- sprintf("Cert_Pibic_%s.pdf", V1) # usar a funcao para nomear os arquivos
  parametros <- list (V1 = V1) # Lista com os parametros a serem usados para impressao
  rmarkdown::render(template, 
                    output_file = outfile,
                    params = parametros)
  invisible(TRUE)
}
  
# Teste com um nome nome aleatório presente na coluna V1
render_nomes("Nome Completo")

# Criar uma lista com os dados da coluna V1
nomes <-list (arquivo.parametros$V1)

# A bruxaria acontece: serão gerados os certificados com os nomes presentes na coluna V1
purrr::pmap(nomes, render_nomes)
    
