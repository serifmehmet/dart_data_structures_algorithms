import '../node/doubly_linked_list.dart';
import 'queue.dart';

class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();

  @override
  E? dequeue() => _list.pop();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;

  @override
  String toString() {
    return _list.toString();
  }
}
