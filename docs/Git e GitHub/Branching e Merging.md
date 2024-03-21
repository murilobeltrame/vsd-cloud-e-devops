# Branching e Merging

# Conceito

_Branching_ e _Merging_ são características do Git que permitem o trabalho de equipes de forma paralela e assíncrona.<br />
_Branching_ significa que você pode criar uma ramificação no histórico do repositório e trabalhar de forma isolada das demais ramificações. Isso permite que modificações nessa ramificação possam ser validadas ou mesmo descartadas de forma facilitada.<br />
_Merging_ é o processo de unir uma ramificação a outra integrando assim o trabalho de multiplas frentes.<br />
Existem diferentes estratégias para _Branching_. Abaixo as mais comuns:

* **Trunk-Based Development**

```mermaid
gitGraph
    commit
    commit
    commit
    commit
    branch release/foo
    checkout release/foo
    checkout main
    merge release/foo
    commit
    commit
    commit
    commit
    branch release/bar
    checkout release/bar
    checkout main
    merge release/bar
```

* **Git Flow**

```mermaid
gitGraph
    commit
    branch develop
    checkout develop
    commit
    branch feature/foo
    checkout feature/foo
    commit
    commit
    checkout develop
    commit
    branch feature/bar
    checkout feature/bar
    commit
    checkout develop
    merge feature/foo
    checkout feature/bar
    commit
    checkout develop
    merge feature/bar
    branch release/xpto
    checkout release/xpto
    commit
    checkout main
    merge release/xpto
    checkout develop
    merge main
```