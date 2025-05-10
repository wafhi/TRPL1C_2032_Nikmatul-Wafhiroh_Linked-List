class DNode {
  dynamic data;
  DNode? next;
  DNode? prev;

  DNode(this.data);
}

class DoubleLinkedList {
  DNode? head;
  DNode? tail;

  // Mengecek apakah Double Linked List kosong
  bool isEmpty() {
    return head == null;
  }

  // Menyisipkan node di akhir
  void insertTailNode(dynamic data) {
    // Validasi data
    if (data == null) {
      print("Data tidak boleh null.");
      return;
    }

    // Membuat node baru
    DNode newNode = DNode(data);

    // Jika Double Linked List kosong
    if (isEmpty()) {
      head = newNode;
      tail = newNode; // Head dan tail sama jika hanya ada satu node
    } else {
      // Menyisipkan node baru di akhir
      tail!.next = newNode; // Tail lama menunjuk ke node baru
      newNode.prev = tail; // Node baru menunjuk kembali ke tail lama
      tail = newNode; // Memperbarui tail ke node baru
    }

    print("Node dengan data '$data' berhasil ditambahkan di akhir.");
  }

  // Menampilkan elemen dalam Double Linked List
  void display() {
    if (isEmpty()) {
      print("Double Linked List kosong.");
      return;
    }

    DNode? current = head;
    print("Isi Double Linked List:");
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  DoubleLinkedList dll = DoubleLinkedList();

  dll.insertTailNode("merah");
  dll.insertTailNode("biru");
  dll.insertTailNode("kuning");

  dll.display();

  dll.insertTailNode(null); // Contoh validasi data null
}

