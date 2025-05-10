class DNode<T> {
  T? nodeValue;          // Menyimpan data node
  DNode<T>? prev;        // Menunjuk node sebelumnya
  DNode<T>? next;        // Menunjuk node berikutnya

  // Konstruktor default
  DNode() {
    nodeValue = null;
    next = this;         // Menunjuk ke dirinya sendiri
    prev = this;
  }

  // Konstruktor dengan parameter (item)
  DNode.withValue(T item) {
    nodeValue = item;
    next = this;         // Menunjuk ke dirinya sendiri
    prev = this;
  }
}
