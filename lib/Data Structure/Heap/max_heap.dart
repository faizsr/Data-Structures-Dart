class MaxHeap {
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
    if (parentIndex >= 0 && heap[parentIndex] < heap[index]) {
      swap(index, parentIndex);
      heapifyUp(parentIndex);
    }
  }

  heapifyDown(int index) {
    int leftChildIndex = getLeftChildIndex(index);
    int rightChildIndex = getRightChildIndex(index);
    int maxIndex = index;
    if (leftChildIndex < heap.length && heap[leftChildIndex] > heap[maxIndex]) {
      maxIndex = leftChildIndex;
    }
    if (rightChildIndex < heap.length &&
        heap[rightChildIndex] > heap[maxIndex]) {
      maxIndex = rightChildIndex;
    }
    if (maxIndex != index) {
      swap(index, maxIndex);
      heapifyDown(maxIndex);
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
    int max = heap[0];
    heap[0] = heap.removeLast();
    heapifyDown(0);
    return max;
  }

  heapSort() {
    List<int> sortedArray = [];
    while (heap.isNotEmpty) {
      sortedArray.add(remove());
    }
    return sortedArray;
  }

  buildHeapFromArray(List<int> array) {
    // heap = array;
    // int firstNonLeafIndex = (array.length - 2) ~/ 2;
    // for (int i = firstNonLeafIndex; i >= 0; i--) {
    //   heapifyDown(i);
    // }
    for (int i = 0; i < array.length; i++) {
      insert(array[i]);
    }
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap.buildHeapFromArray([3, 7, 2, 1, 9, 8]);
  // maxHeap.insert(10);
  // maxHeap.insert(5);
  // maxHeap.insert(2);
  // maxHeap.insert(3);
  // maxHeap.insert(4);
  print(maxHeap.heap);
  // print(maxHeap.remove());
  // print(maxHeap.heap);
  // print(maxHeap.heapSort());
}
