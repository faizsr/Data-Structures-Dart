class Graph {
  late List<String> vertices;
  late Map<String, List<String>> edges;

  Graph() {
    vertices = [];
    edges = {};
  }

  void addVertex(String vertex) {
    vertices.add(vertex);
    edges[vertex] = [];
  }

  void addEdge(String vertex1, String vertex2) {
    edges[vertex1]!.add(vertex2);
    edges[vertex2]!.add(vertex1);
  }

  void display() {
    for (var vertex in vertices) {
      String neighbors = edges[vertex]!.join(', ');
      print('$vertex --> $neighbors');
    }
  }

  bool hasEdge(vertex1, vertex2) {
    return edges[vertex1]!.contains(vertex2) &&
        edges[vertex2]!.contains(vertex1);
  }

  deleteEdge(vertex1, vertex2) {
    edges[vertex1]!.remove(vertex2);
    edges[vertex2]!.remove(vertex1);
  }

  deleteVertex(vertex) {
    if (!edges.containsKey(vertex)) {
      return null;
    }
    edges.remove(vertex);
    for (var otherVertex in edges.keys) {
      edges[otherVertex]!.remove(vertex);
    }
    vertices.remove(vertex);
  }
}

void main() {
  Graph graph = Graph();
  graph.addVertex("A");
  graph.addVertex("B");
  graph.addVertex("C");
  graph.addVertex("D");
  graph.addEdge("A", "D");
  graph.addEdge("C", "B");
  graph.addEdge("B", "D");
  graph.display();
  print(graph.hasEdge('D', 'C'));
  graph.deleteEdge("B", "C");
  graph.display();
  print('--------');
  graph.deleteVertex("C");
  graph.display();
}
