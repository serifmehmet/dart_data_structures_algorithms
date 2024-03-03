import 'queue.dart';
import 'ring_buffer.dart';

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }

    _ringBuffer.write(element);
    return true;
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

extension BoardGameManager<E> on QueueRingBuffer<E> {
  E? nextPlayer() {
    final person = dequeue();
    if (person != null) {
      enqueue(person);
    }

    return person;
  }
}
