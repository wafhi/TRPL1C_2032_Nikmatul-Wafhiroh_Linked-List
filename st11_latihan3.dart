class DNode<T> {
  T data;
  DNode<T>? next;
  DNode<T>? prev;

  DNode(this.data);
}

class DoubleLinkedList<T> {
  DNode<T>? head;
  DNode<T>? tail;

  // Mengecek apakah Double Linked List kosong
  bool isEmpty() {
    return head == null;
  }

  // Menyisipkan node sebelum target
  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    // Validasi jika target atau newNode null
    if (newNode == null || target == null) {
      print("Node baru atau target tidak boleh null.");
      return;
    }

    // Jika target adalah head
    if (target == head) {
      newNode.next = head; // Node baru menunjuk ke head lama
      newNode.prev = null; // Node baru tidak memiliki prev
      head!.prev = newNode; // Head lama menunjuk kembali ke node baru
      head = newNode; // Memperbarui head ke node baru
      print("Node berhasil ditambahkan sebelum head.");
    } else {
      // Mencari target node di dalam list
      DNode<T>? current = head;
      while (current != null && current != target) {
        current = current.next;
      }

      // Jika target tidak ditemukan
      if (current == null) {
        print("Target node tidak ditemukan.");
        return;
      }

      // Menyisipkan node baru sebelum target
      newNode.prev = current.prev; // Node baru menunjuk ke prev target
      newNode.next = current; // Node baru menunjuk ke target
      current.prev!.next = newNode; // Node sebelum target menunjuk ke node baru
      current.prev = newNode; // Target menunjuk kembali ke node baru
      print("Node berhasil ditambahkan sebelum target.");
    }
  }

  // Menampilkan elemen dalam Double Linked List
  void display() {
    if (isEmpty()) {
      print("Double Linked List kosong.");
      return;
    }

    DNode<T>? current = head;
    print("Isi Double Linked List:");
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  DoubleLinkedList<String> dll = DoubleLinkedList<String>();

  DNode<String> node1 = DNode("merah");
  DNode<String> node2 = DNode("biru");
  DNode<String> node3 = DNode("kuning");

  dll.head = node1;
  dll.tail = node3;

  node1.next = node2;
  node2.prev = node1;
  node2.next = node3;
  node3.prev = node2;

  dll.display();

  DNode<String> newNode = DNode("hijau");
  dll.tambahNode_Sebelum(newNode, node2);

  dll.display();
}

