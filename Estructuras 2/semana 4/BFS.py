from collections import deque

graph = {}
graph['you']    = ["alice","bob","claire"]
graph['alice']  = ["peggy"]
graph['bob']    = ["anuj", "peggy"]
graph['claire'] = ["thom","jonny"]
graph['peggy']  = []
graph['anuj']   = []
graph['thom']   = []
graph['jonny']  = []

graph2 = {}
graph2['A']   = ["B","C","D"]
graph2['B']   = ["C","D"]
graph2['C']   = [""]
graph2['D']   = ["Fin"]
graph2['E']   = ["C","Fin"]
graph2['Fin'] = []

def person_is_seller(person):
    return person[-1] == "m"

def search(name):
    search_queue = deque()
    search_queue += graph[name]
    searched = []
    while search_queue:
        person = search_queue.popleft()
        if not person in searched:
            if person_is_seller(person):
                print(person,"is a mango seller!")
                return person
            else:
                search_queue += graph[person]
                searched.append(person)
    return ""

seller = search('you')
path = [seller]
person_search = seller

def get_path(person_search):
    for node in graph:
        if person_search in graph[node]:
            person_search = node
            path.append(node)
            get_path(person_search)
            return
        if person_search == "you":
            print(f"Path: {path}")
            return

get_path(person_search)
