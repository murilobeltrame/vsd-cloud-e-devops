# Comandos básicos

* `git init`:
    * **Utilidade**: Inicializa um repositório Git em um diretório local.
    * **Uso comum**: É executado uma vez no início de um novo projeto para começar a rastrear as alterações nos arquivos.
* `git clone [url]`:
    * **Utilidade**: Clona um repositório Git existente para o diretório local.
    * **Uso comum**: Usado para obter uma cópia local de um repositório remoto para colaboração ou desenvolvimento.
* `git add` [file]:
    * **Utilidade**: Adiciona alterações ao index (área de preparação) para serem incluídas no próximo commit.
    * **Uso comum**: Antes de confirmar as alterações com um commit, elas devem ser adicionadas ao index com este comando.
* `git commit -m "mensagem"`:
    * **Utilidade**: Cria um novo commit com as alterações atualmente no index.
    * **Uso comum**: Utilizado para salvar alterações em um repositório Git, juntamente com uma mensagem descritiva que resume as alterações feitas.
* `git status`:
    * **Utilidade**: Exibe o estado atual do repositório, incluindo quais arquivos foram modificados, adicionados ou removidos.
    * **Uso comum**: Usado frequentemente para verificar o status das alterações antes de adicionar ou confirmar as mudanças.
* `git pull`:
    * **Utilidade**: Obtém as alterações mais recentes do repositório remoto e as mescla com o branch local.
    * **Uso comum**: Usado para atualizar o branch local com as alterações feitas por outros colaboradores no repositório remoto.
* `git push`:
    * **Utilidade**: Envia os commits locais para o repositório remoto.
    * **Uso comum**: Após concluir alterações e commits locais, este comando é usado para enviar as mudanças para o servidor remoto, permitindo que outros colaboradores as vejam e acessem.
* `git branch`:
    * **Utilidade**: Lista todos os branches locais e indica o branch atual.
    * **Uso comum**: Útil para verificar os branches disponíveis e determinar em qual branch você está trabalhando atualmente.
* `git checkout [branch]`:
    * **Utilidade**: Altera o branch atual para o especificado.
    * **Uso comum**: Usado para alternar entre branches existentes para trabalhar em diferentes recursos ou correções de bugs.
* `git merge [branch]`:
    * **Utilidade**: Mescla as alterações de um branch especificado para o branch atual.
    * **Uso comum**: Após completar o trabalho em um branch de recurso, você pode mesclar as alterações desse branch de volta para o branch principal (como o main ou master).
* `git log`:
    * **Utilidade**: Exibe um registro de commits no repositório, incluindo autor, data e mensagem de commit.
    * **Uso comum**: Útil para revisar o histórico de alterações e entender o que foi feito no projeto ao longo do tempo.