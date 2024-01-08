class MaxHeap {
  List<int> heap = [];

  swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  insert(int value) {
    heap.add(value);
  }

  remove() {
    if (heap.isEmpty) {
      return null;
    }
    if (heap.length == 1) {
      return heap.removeLast();
    }
    int max = heap[0];
    heap[0] = heap.removeLast();
    heapifyDown(0);
    return max;
  }

  heapSort() {
    List<int> sortedHeap = [];
    while (heap.isNotEmpty) {
      sortedHeap.add(remove());
    }
    return sortedHeap;
  }

  buildHeapFromArray(List<int> arr) {
    heap = arr;
    int firstIndex = (arr.length - 2) ~/ 2;
    for (int i = firstIndex; i >= 0; i--) {
      heapifyDown(i);
    }
  }

  heapifyUp(int index) {
    int parentIndex = (index - 2) ~/ 2;
    if (parentIndex >= 0 && heap[parentIndex] < heap[index]) {
      swap(parentIndex, index);
      heapifyUp(parentIndex);
    }
  }

  heapifyDown(int index) {
    int left = (2 * index) + 1;
    int right = (2 * index) + 2;
    int max = index;
    if (left < heap.length && heap[left] > heap[max]) {
      max = left;
    }
    if (right < heap.length && heap[right] > heap[max]) {
      max = right;
    }
    if (max != index) {
      swap(max, index);
      heapifyDown(max);
    }
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.buildHeapFromArray([3, 7, 2, 1, 9]);
  print(maxHeap.heap);
  print(maxHeap.heapSort());
}
