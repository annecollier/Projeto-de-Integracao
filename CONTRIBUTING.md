# Guia de Contribuição

Primeiramente, obrigado pelo seu interesse em contribuir com o Projeto-de-Integracao! 🎉 
Este documento descreve os padrões que seguimos para manter o código limpo, organizado e fácil de dar manutenção.

## 💻 Como rodar o projeto localmente

## 🌿 Padrão de Branches

Para criar uma nova branch, utilize o formato `<tipo>/<numero-da-tarefa>-<breve-descricao>` ou `<tipo>/<breve-descricao>`:

* **Feature:** `feature/nome-da-funcionalidade` ou `feature/123-login`
* **Bugfix:** `bugfix/nome-do-bug`
* **Hotfix:** `hotfix/nome-da-correcao-critica`

## 💬 Padrão de Commits

Utilizamos o padrão **Conventional Commits**. Sua mensagem de commit deve seguir o formato:

```
<tipo>[escopo opcional]: <descrição>

[corpo opcional]

[rodapé opcional]
```
Sempre que necessário, incluir a justificativa das alterações no corpo do commit.

Optamos por commits atômicos que realizam uma tarefa por vez em um único contexto, mas agrupando sub-tarefas pequenas demais para não poluir o histórico de commits.


**Exemplo:**
Imagine que você está trabalhando na sua branch isolada (feature/novo-header) e fez três commits ao longo do dia para não perder o progresso:

    feat: inicia construcao do header

    fix: ajusta cor do fundo que ficou estranha

    fix: centraliza a logo e finaliza tarefa

Você quer juntar esses três em um único commit perfeito: `feat(ui): cria novo header do site antes de mandar para aprovação`. Utilizar o Interactive Rebase com a opção de Squash pode ajudar a agrupar esses commits.

**Tipos permitidos:**
* `feat`: Uma nova funcionalidade
* `fix`: Correção de um bug
* `docs`: Alterações na documentação
* `style`: Formatação de código (espaços, vírgulas, etc.)
* `refactor`: Refatoração de código
* `test`: Adição ou correção de testes
* `chore`: Atualização de pacotes, configurações de build, etc.

**Exemplo:**
`feat(auth): adiciona validacao de email no login`

**Exemplo:**
```
feat(carrinho): adiciona cálculo de frete por CEP

O cálculo de frete anterior era fixo e causava prejuízos 
em entregas para as regiões Norte e Nordeste. Esta alteração 
integra a API dos Correios para cálculos dinâmicos baseados no peso 
e no CEP de destino do cliente.

BREAKING CHANGE: a rota `/api/checkout` agora exige o campo `cep`.
Resolves #109
```