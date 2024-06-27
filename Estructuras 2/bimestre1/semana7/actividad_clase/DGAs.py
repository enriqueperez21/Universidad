def indegree(nodo, grafo):
    incount = 0
    for values in grafo.keys():
        if nodo in grafo[values]:
            incount += 1
    return incount

def topological_sort(grafo):
    top_sorted = []
    ready = []
    incount = {}

    for nodo in grafo.keys():
        incount[nodo] = indegree(nodo, grafo)
        if incount[nodo] == 0:
            ready.append(nodo)
    print(f"Indegree: {incount}")
    print(f"READY: {ready}")

    while len(ready) > 0:
        nodo = ready.pop()
        print(f"Nodo para usarse {nodo}")
        top_sorted.append(nodo)
        for vecino in grafo[nodo]:
            print(f"Vecino: {incount[vecino]} -1 ")
            incount[vecino] -= 1
            if incount[vecino] == 0:
                ready.append(vecino)
        print(f"READY: {ready}")

    return top_sorted

grafo1 = {
    'A': ['C'],
    'B': ['C','D'],
    'C': ['D'],
    'D': ['E'],
    'E': []
}

result = topological_sort(grafo1)
print(result)