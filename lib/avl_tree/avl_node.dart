class AvlNode<T> {
  AvlNode(this.value);
  T value;
  AvlNode<T>? leftChild;
  AvlNode<T>? rightChild;

  int height = 0;

  int get balanceFactor => leftHeight - rightHeight;

  int get leftHeight => leftChild?.height ?? -1;

  int get rightHeight => rightChild?.height ?? -1;

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    AvlNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }

    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );

    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );

    return '$a$b$c';
  }

  /// - If the current node has left child, recursively visit the first child.
  /// - Then visit node itself
  /// - If the current node has right child, recursively visit this child.
  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  /// Always visits the current node first, then recursively visits the left and right child.
  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  /// Only visits the current node after the left and right childs have been visited recursively.
  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  // int height(AvlNode? node) {
  //   if (node == null) return -1;

  //   return 1 +
  //       max(
  //         height(node.leftChild),
  //         height(node.rightChild),
  //       );
  // }
}

extension Serializable<T> on AvlNode<T> {
  void traversePreOrderWithNull(void Function(T? value) action) {
    action(value);
    if (leftChild == null) {
      action(null);
    } else {
      leftChild!.traversePreOrderWithNull(action);
    }

    if (rightChild == null) {
      action(null);
    } else {
      rightChild!.traversePreOrderWithNull(action);
    }
  }
}
