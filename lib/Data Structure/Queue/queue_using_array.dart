class Queue {
  List<int> items;
  Queue({List<int>? items}) : items = items ?? [];

  enqueue(int element) {
    items.add(element);
  }

  dequeue() {
    return items.removeAt(0);
  }

  isEmpty() {
    return items.isEmpty;
  }

  peek() {
    if (!isEmpty()) {
      return items[0];
    }
    return null;
  }

  size() {
    return items.length;
  }

  display() {
    print(items.toString());
  }
}

void main() {
  Queue queue = Queue();

  print(queue.isEmpty());
  queue.enqueue(10);
  queue.enqueue(5);
  queue.enqueue(8);
  queue.display();
  print(queue.size());
  queue.dequeue();
  queue.display();
  print(queue.peek());
  print(queue.size());
  print(queue.isEmpty());
}
