# Branching e Merging

# Conceito

_Branching_ e _Merging_ são características do Git que permitem o trabalho de equipes de forma paralela e assíncrona.<br />
_Branching_ significa que você pode criar uma ramificação no histórico do repositório e trabalhar de forma isolada das demais ramificações. Isso permite que modificações nessa ramificação possam ser validadas ou mesmo descartadas de forma facilitada.<br />
_Merging_ é o processo de unir uma ramificação a outra integrando assim o trabalho de multiplas frentes.<br />
Existem diferentes estratégias para _Branching_. Abaixo as mais comuns:

* **Git Flow**

```mermaid
gitGraph
    commit
    branch develop
    checkout develop
    branch feature/foo
    checkout feature/foo
    commit
    commit
    branch feature/bar
    checkout feature/bar
    commit
    checkout develop
    merge feature/foo
    checkout feature/bar
    commit
    checkout develop
    merge feature/foo
    branch release/bar
    checkout release/bar
    commit
    checkout main
    merge release/bar
    checkout develop
    merge main
```