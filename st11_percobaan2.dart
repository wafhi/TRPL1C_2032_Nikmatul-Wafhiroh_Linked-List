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

  // Menghapus node dari depan
  void DeleteFront() {
    if (isEmpty()) {
      print("Double Linked List kosong. Tidak ada node untuk dihapus.");
      return;
    }

    if (head!.next != null) {
      // Jika list memiliki lebih dari satu node
      DNode? delete = head;     // Simpan node yang akan dihapus
      head = head!.next;        // Pindahkan head ke node berikutnya
      head!.prev = null;        // Putuskan link ke node lama
      delete!.next = null;      // Bersihkan link node lama
      print("Node dengan data '${delete.data}' berhasil dihapus dari depan.");
    } else {
      // Jika hanya satu node di list
      print("Node dengan data '${head!.data}' berhasil dihapus dari depan.");
      head = null;
      tail = null; // Kosongkan tail juga
    }
  }

  // Menambahkan node di depan
  void InsertBeforeHead(dynamic data) {
    DNode newNode = DNode(data);
    if (isEmpty()) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
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

  dll.InsertBeforeHead("merah");
  dll.InsertBeforeHead("biru");
  dll.InsertBeforeHead("kuning");

  dll.display();

  dll.DeleteFront();
  dll.display();

  dll.DeleteFront();
  dll.display();

  dll.DeleteFront();
  dll.display();

  dll.DeleteFront(); // Menghapus dari Linked List kosong
}
