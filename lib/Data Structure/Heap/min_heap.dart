class MinHeap {
  List<int> heap = [];

  getParentIndex(int index) {
    return (index - 1) ~/ 2;
  }

  getLeftChildIndex(int index) {
    return 2 * index + 1;
  }

  getRightChildIndex(int index) {
    return 2 * index + 2;
  }

  swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  heapifyUp(int index) {
    int parentIndex = getParentIndex(index);
    if (parentIndex >= 0 && heap[parentIndex] > heap[index]) {
      swap(index, parentIndex);
      heapifyUp(parentIndex);
    }
  }

  heapifyDown(int index) {
    int leftChildIndex = getLeftChildIndex(index);
    int rightChildIndex = getRightChildIndex(index);
    int minIndex = index;
    if (leftChildIndex < heap.length && heap[leftChildIndex] < heap[minIndex]) {
      minIndex = leftChildIndex;
    }
    if (rightChildIndex < heap.length &&
        heap[rightChildIndex] < heap[minIndex]) {
      minIndex = rightChildIndex;
    }
    if (minIndex != index) {
      swap(index, minIndex);
      heapifyDown(minIndex);
    }
  }

  insert(int value) {
    heap.add(value);
    heapifyUp(heap.length - 1);
  }

  remove() {
    if (heap.isEmpty) {
      return null;
    }
    if (heap.length == 1) {
      return heap.removeLast();
    }
    int min = heap[0];
    heap[0] = heap.removeLast();
    heapifyDown(0);
    return min;
  }

  heapSort() {
    List<int> sortedArray = [];
    while (heap.isNotEmpty) {
      sortedArray.add(remove());
    }
    return sortedArray;
  }

  buildHeapFromArray(List<int> array) {
    heap = array;
    int firstNonLeafIndex = (array.length - 2) ~/ 2;
    for (int i = firstNonLeafIndex; i >= 0; i--) {
      heapifyDown(i);
    }
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.buildHeapFromArray([3, 7, 2, 1, 9, 8]);
  // minHeap.insert(10);
  // minHeap.insert(5);
  // minHeap.insert(2);
  // minHeap.insert(3);
  // minHeap.insert(4);
  print(minHeap.heap);
  print(minHeap.remove());
  print(minHeap.heap);
  print(minHeap.heapSort());
}
