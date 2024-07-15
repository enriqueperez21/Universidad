def find_lowest_cost_node(costs, processed):
    lowest_cost = float("inf")
    lowest_cost_node = None
    for node in costs:
        cost = costs[node]
        if cost < lowest_cost and node not in processed:
            lowest_cost = cost
            lowest_cost_node = node
    return lowest_cost_node

def dijkstra(graph, costs, parents):
    processed = []
    node = find_lowest_cost_node(costs, processed)
    while node is not None:
        cost = costs[node]
        neighbors = graph[node]
        if neighbors == {None}:
            processed.append(node)
            node = find_lowest_cost_node(costs, processed)
            continue
        for n in neighbors.keys():
            new_cost = cost + neighbors[n]
            if costs[n] > new_cost:
                costs[n] = new_cost
                parents[n] = node
        processed.append(node)
        node = find_lowest_cost_node(costs, processed)
    return parents, costs

grafo2 = {
    '0': {'2': 0.26, '4': 0.38},
    '1': {'3': 0.29},
    '2': {'7': 0.34},
    '3': {'6': 0.52},
    '4': {'5': 0.35, '7': 0.37},
    '5': {'1': 0.32, '4': 0.35, '7': 0.28},
    '6': {'0': 0.58, '2': 0.40, '4': 0.93},
    '7': {'3': 0.39, '5': 0.28}
}
parents2 = {
    '4': '0',
    '2': '0',
    '7': None,
    '3': None,
    '6': None,
    '5': None,
    '1': None
}
costs2 = {
    '0': float("inf"),
    '4': 0.38,
    '2': 0.26,
    '7': float("inf"),
    '3': float("inf"),
    '6': float("inf"),
    '5': float("inf"),
    '1': float("inf")
}

f_parents2, f_costs2 = dijkstra(grafo2, costs2, parents2)
print(f'{f_parents2} - {f_costs2}')