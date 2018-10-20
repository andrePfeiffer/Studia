## Tarefas críticas  
Ordenação de aulas, ordenação de componentes da aula  
  
## Progress  
UCS01 5/5  
UCS02 7/8  
UCS04 0/3  
UCS05 0/2  
UCS09 6/16  

## Working on  
UCS09


## UCS01 Autenticar usuário  
~~**FT: login**~~  
~~**Fluxo Alternativo 1:** O nome de usuário ou a senha não são válidos.~~  
~~**Fluxo Alternativo 2:** Ator escolhe a opção de redefinição de senha.~~  
~~**Fluxo Alternativo 3:** Nome de usuário informado não foi encontrado para a redefinição de senha.~~  
~~**Fluxo Alternativo 4:** Erro na nova senha informada.~~  

## UCS02 Manter conta  
**FT:** listar contas para administrador  
1 Sistema consulta as permissões do ator.  
2 Sistema verifica que o ator é Administrador.  
3 Sistema exibe a opção de “Consultar Contas” e “Alterar sua Conta”.  
4 Ator seleciona a opção “Consultar Contas”.  
5 Sistema exibe a lista de contas cadastradas no sistema com a informação de nome de usuário e e-mail.  
6 Fim do caso de uso.  

~~**Fluxo Alternativo 1:** O ator não está autenticado no sistema.~~  
~~**Fluxo Alternativo 2:** O ator está autenticado no sistema mas não é administrador.~~  
~~**Fluxo Alternativo 3:** O nome de usuário já existe.~~  
~~**Fluxo Alternativo 4:** O e-mail já está vinculado a outro usuário existente no sistema.~~  
~~**Fluxo Alternativo 5:** As senhas não são idênticas.~~  
~~**Fluxo Alternativo 6:** A senha não atende aos requisitos de segurança.~~  
~~**Fluxo Alternativo 7:** Campo obrigatório não preenchido.~~  

## UCS04 Assistir aula  
**FT:** o aluno escolhe o curso, escolhe a aula, assiste e marca como concluída  
1 O sistema exibe as aulas do curso escolhido.  
2 O ator escolhe uma aula.  
3 O sistema exibe a lista de vídeos, de material didático e de exercícios da aula escolhida em uma ordem pré-determinada pelo instrutor.  
4 O ator escolhe um conteúdo.  
5 O sistema exibe o conteúdo.  
6 O ator escolhe a opção “concluir conteúdo”.  
7 O sistema grava que o conteúdo foi concluído pelo ator.  
8 O sistema verifica que não existe um conteúdo seguinte.  
9 O sistema exibe uma mensagem de “aula concluída”.  
10 Fim de caso de uso.  

**Fluxo Alternativo 1:** Existe um conteúdo seguinte.  
1 O sistema exibe o próximo conteúdo.  
2 Retorna ao passo 6 do Fluxo Típico.  

**Fluxo Alternativo 2:** O conteúdo selecionado é um exercício.  
1 O sistema exibe o enunciado do exercício escolhido e solicita ao ator que informe a solução.  
2 O ator preenche a solução ao exercício e confirma.  
3 O sistema apresenta uma mensagem de confirmação de envio de solução e a opção “concluir conteúdo”.  
4 Retorna ao passo 6 do Fluxo Típico.  

# UCS05 Avaliar conteúdo  
**FT:** o usuario avalia um conteudo  
1 Ator acessa um conteúdo do sistema.  
2 O sistema exibe as opções “útil” e “não útil”.  
3 Ator escolhe a opção desejada .  
4 Sistema grava o resultado.  
5 O sistema mostra a modificação da avaliação.  
6 O sistema desabilita as opções “útil” e “não útil”.  
7 Fim do caso de uso.  

**Fluxo Alternativo 1:** O ator já avaliou o conteúdo.  
1 O sistema exibe o valor da avaliação anterior com as opções de nova avaliação desabilitadas.  
2 Fim do caso de uso.  


# UCS09 Manter curso  
**FT:** o usuario reordena a lista de cursos  
1 Ator escolhe a opção de Gerenciamento de Cursos.  
2 Sistema mostra o Gerenciamento de Cursos com um campo para “Pesquisar Curso”, uma opção para “Incluir Curso” e uma lista dos cursos criados pelo ator com a opção “Editar Curso” para cada item da lista.  
3 O ator seleciona o curso desejado.  
4 Sistema solicita ao autor o Título, Descrição, Assunto, uma opção para tornar o curso público ou privado com cada campo contendo os valores previamente preenchidos e a lista de aulas com conteúdo arrastável e com a opção “Editar aula” para cada item da lista, uma opção de “Adicionar aula” e a opção “Salvar”.  
5 Ator altera a ordem de exibição do conteúdo e edita as informações que deseja alterar e clica em “Salvar”.  
6 Sistema exibe a mensagem de curso gravado com sucesso.  
7 Fim do caso de uso.  

~~**Fluxo Alternativo 1:** Pesquisar curso.~~  
~~**Fluxo Alternativo 2:** Incluir curso.~~  
~~**Fluxo Alternativo 3:** Adicionar aula.~~  
~~**Fluxo Alternativo 4:** Validação da aula falha ao incluir aula.~~  

**Fluxo Alternativo 5:** Editar aula.  
1 Sistema exibe ao Ator em campos editáveis Título, Descrição, Assunto e se a aula é pública ou privada e exibe a opção “Salvar” com cada campo contendo os valores previamente preenchidos, uma lista ordenável de materiais, vídeos e exercícios da aula com uma opção de “remover” para cada item e as opções de “adicionar vídeo”, “adicionar material” e “adicionar exercício”.  

~~**Fluxo Alternativo 6:** Validação da aula falha ao editar aula.~~  

**Fluxo Alternativo 7:** Ator seleciona adicionar exercício.  
1 Sistema solicita ao Ator que informe a descrição, se o exercício é público ou privado e exibe a opção “salvar”.  
2 Ator preenche as informações acima e seleciona a opção “Salvar”.  
3 Sistema exibe mensagem de exercício gravado com sucesso.  
4 Retorna ao passo 1 do Fluxo Alternativo 5.  

**Fluxo Alternativo 8:** Ator seleciona editar exercício.  
1 Sistema solicita ao Ator que informe a descrição, marque o exercício como público ou privado e exibe a opção “salvar” com cada campo contendo os valores previamente preenchidos.  
2 Ator preenche as informações acima e seleciona a opção “Salvar”.  
3 Sistema exibe mensagem de exercício gravado com sucesso.  
4 Retorna ao passo 1 do Fluxo Alternativo 5.  

**Fluxo Alternativo 9:** Ator seleciona adicionar material.  
1 Sistema solicita ao Ator que informe a descrição, campo para enviar o material e se o material é público ou privado e exibe a opção “salvar”.  
2 Ator preenche as informações acima e seleciona a opção “Salvar”.  
3 Sistema exibe mensagem de material gravado com sucesso.  
4 Retorna ao passo 1 do Fluxo Alternativo 5.  

**Fluxo Alternativo 10:** Ator seleciona editar material.  
1 Sistema solicita ao Ator que informe a descrição e marque o material como público ou privado e exibe a opção “salvar” com cada campo contendo os valores previamente preenchidos.  
2 Ator preenche as informações acima e seleciona a opção “Salvar”.  
3 Sistema exibe mensagem de material gravado com sucesso.  
4 Retorna ao passo 1 do Fluxo Alternativo 5.  

~~**Fluxo Alternativo 11:** Ator seleciona adicionar vídeo.~~  

**Fluxo Alternativo 12:** Sistema verifica que o vídeo não possui tamanho correto.errado  
1 Sistema retorna com mensagem informando que o tamanho do vídeo está errado e qual é o tamanho e formato aceitáveis  
2 Retorna para o passo 1 do Fluxo Alternativo 11  

**Fluxo Alternativo 13:** Sistema verifica que o vídeo não possui formato correto.  
1 Sistema retorna com mensagem informando que o formato do vídeo está errado e qual é o tamanho e formato aceitáveis  
2 Retorna para o passo 1 do Fluxo Alternativo 11  

**Fluxo Alternativo 14:** Ator seleciona editar vídeo.  
1 Sistema solicita ao Ator que informe a descrição e marque o vídeo como público ou privado e exibe a opção “salvar” com cada campo contendo os valores previamente preenchidos  
2 Ator preenche as informações acima e seleciona a opção “Salvar”.  
3 Sistema exibe mensagem de vídeo gravado com sucesso.  
4 Retorna ao passo 1 do Fluxo Alternativo 5  

**Fluxo Alternativo 15:** Ator seleciona remover material, vídeo ou exercício.  
1 Sistema exibe mensagem de conteúdo removido com sucesso.  
2 Retorna ao passo 1 do Fluxo Alternativo 5  
