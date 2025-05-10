class Node {
  int nodeValue;
  Node? next;

  Node(this.nodeValue);
}

class SingleLinkedList {
  Node? head = null;

  // Menambahkan node di akhir Linked List
  void add(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
    print("Node dengan nilai $data berhasil ditambahkan.");
  }

  // Menghapus node berdasarkan nilai data
  void delete(int data) {
    if (head == null) {
      print("Linked List kosong. Tidak ada node untuk dihapus.");
      return;
    }

    if (head!.nodeValue == data) {
      head = head!.next;
      print("Node dengan nilai $data berhasil dihapus.");
      return;
    }

    Node? current = head;
    while (current!.next != null && current.next!.nodeValue != data) {
      current = current.next;
    }

    if (current.next == null) {
      print("Node dengan nilai $data tidak ditemukan.");
    } else {
      current.next = current.next!.next;
      print("Node dengan nilai $data berhasil dihapus.");
    }
  }

  // Menemukan node berdasarkan nilai data
  Node? findNode(int data) {
    Node? current = head; // Mulai dari head
    while (current != null) {
      if (current.nodeValue == data) {
        return current; // Kembalikan node jika ditemukan
      }
      current = current.next; // Pindah ke node berikutnya
    }
    return null; // Kembalikan null jika tidak ditemukan
  }

  // Menampilkan semua elemen dalam Linked List
  void display() {
    if (head == null) {
      print("Linked List kosong.");
      return;
    }

    Node? current = head;
    print("Isi Linked List:");
    while (current != null) {
      print(current.nodeValue);
      current = current.next;
    }
  }
}

void main() {
  SingleLinkedList linkedList = SingleLinkedList();

  // Menambahkan node
  linkedList.add(10);
  linkedList.add(20);
  linkedList.add(30);

  // Menampilkan Linked List
  linkedList.display();

  // Menemukan node
  Node? foundNode = linkedList.findNode(20);
  if (foundNode != null) {
    print("Node dengan nilai ${foundNode.nodeValue} ditemukan.");
  } else {
    print("Node tidak ditemukan.");
  }

  // Menghapus node
  linkedList.delete(20);
  linkedList.display();

  // Mencoba menghapus node yang tidak ada
  linkedList.delete(40);
  linkedList.display();
}
