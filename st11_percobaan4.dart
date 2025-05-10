import 'dart:io';

// Class Node
class DNode<T> {
  T nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.nodeValue) : prev = null, next = null;
}

// Class DoubleLinkedList
class DoubleLinkedList<T> {
  DNode<T>? head; // Awal list
  DNode<T>? tail; // Akhir list

  bool isEmpty() => head == null;

  // Method untuk mencetak isi list (Percobaan 4)
  void printList() {
    DNode<T>? current = head;
    tail = null;

    stdout.write("Traversal in Forward Direction: ");
    while (current != null) {
      stdout.write("${current.nodeValue} ");
