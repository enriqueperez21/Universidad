def dfs(nodo, grafo, searched, componentR):
    componentR.append(nodo)
    searched[nodo] = True
    print(searched)
    print('Vecinos de',nodo,':',grafo[nodo])

    for vecino in grafo[nodo]:
        if not searched[vecino]:
            dfs(vecino, grafo, searched, componentR)
            print('Finaliza', vecino)
            print('Vuelve a',nodo)
            print()


grafo = {
    0: [],
    1: [2,3],
    2: [1,3,4,5],
    3: [1,2,5,7,8],
    4: [2,5],
    5: [2,3,4,6],
    6: [5],
    7: [3,8],
    8: [3,7]
}

grafo2 = {
    0: [1,2,5],
    1: [0,2],
    2: [0,1,3,4],
    3: [2,4,5],
    4: [2,3],
    5: [0,3]
}

nodoS=1
searched = [False]*len(grafo)
print(searched)
componentR = []

dfs(nodoS, grafo2, searched, componentR)
print(f"La búsqueda DFS es: {componentR}")
