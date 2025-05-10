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

  // Menyisipkan node sebelum head
  void insertBeforeHead(dynamic data) {
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
      // Menyisipkan node baru sebelum head
      newNode.next = head; // Node baru menunjuk ke head lama
      head!.prev = newNode; // Head lama menunjuk kembali ke node baru
      head = newNode; // Memperbarui head ke node baru
    }

    print("Node dengan data '$data' berhasil ditambahkan sebelum head.");
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

  dll.insertBeforeHead("merah");
  dll.insertBeforeHead("biru");
  dll.insertBeforeHead("kuning");

  dll.display();

  dll.insertBeforeHead(null); // Contoh validasi data null
}
