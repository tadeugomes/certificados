## Script para renderizar os certificados ##


# cria-se uma funcao com o pacote purrr.
# A variavel V1 abaixo é a coluna onde estao os nomes.
# Pode-se indicar outros dados como indice.

library(purrr)

render_nomes<-function(nome_completo, polo, papel){
  template <- "parametros.Rmd"  # template previamente criado em Rmarkdown
  outfile <- sprintf("Cert_Pibic_%s.pdf", nome_completo) # usar a funcao para nomear os arquivos
  parametros <- list (nome_completo = nome_completo, polo = polo, papel = papel) # Lista com os parametros a serem usados para impressao
  rmarkdown::render(template, 
                    output_file = outfile,
                    params = parametros)
  invisible(TRUE)
}
  
# Teste com um nome nome aleatório presente na coluna V1
render_nomes()

  # Criar uma lista com os dados da coluna V1
nomes <-list (arquivo.parametros$nome_completo, arquivo.parametros$polo, arquivo.parametros$papel)

# A bruxaria acontece: serão gerados os certificados com os nomes presentes na coluna V1
purrr::pmap(nomes, render_nomes)
                            
