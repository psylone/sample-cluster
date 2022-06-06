# SampleCluster

Распределенные процессы средствами [`libcluster`](https://hexdocs.pm/libcluster) и [`horde`](https://hexdocs.pm/horde).

Для формирования кластера используется стратегия [`Cluster.Strategy.Gossip`](https://hexdocs.pm/libcluster/Cluster.Strategy.Gossip.html#content).

`Horde.Registry` и `Horde.DynamicSupervisor` используют динамическое определение Elixir узлов с помощью опции [`members: :auto`](https://hexdocs.pm/horde/libcluster.html#automatic-cluster-membership).

## Как запустить

```
> PORT=4000 iex --sname node-1 -S mix
> PORT=4001 iex --sname node-2 -S mix
> PORT=4002 iex --sname node-3 -S mix
```

Эндпоинт `/{user}/account` возвращает `pid` созданного процесса для конкретного пользователя.

Например:

```
curl 'localhost:4001/bob/account
#PID<0.427.0>
```

После того как процесс для пользователя будет поднят, можно читать и писать в него данные:

```
Account.put("bob", :acc_id, 121)
:ok

Account.get("bob", :acc_id)
121
```
