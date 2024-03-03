import 'lib/avl_tree/avl_tree.dart';
import 'lib/binary_tress/binary_node.dart';
import 'lib/binary_tress/binary_search_tree.dart';
import 'lib/node/linked_list.dart';
import 'lib/node/node.dart';
import 'lib/queue/queue_linked_list.dart';
import 'lib/queue/queue_ring_buffer.dart';
import 'lib/queue/queue_stack.dart';
import 'lib/stack.dart';
import 'lib/tree/tree.dart';

///treeMain
// void main() {
//   final tree = createBinaryTree();
//   final list = serialize(tree);
//   print(list);
//   final newTree = deserializeHelper(list);
//   print(newTree.toString());
// }

// void main() {
//   final tree = buildExampleTree();
//   final secondTree = buildExampleTreeSecond();

//   // if (tree.contains(5)) {
//   //   print('found');
//   // } else {
//   //   print('not found');
//   // }

//   // print(tree);
//   print(isEqual(tree, secondTree));
//   // print('Tree before removal:');
//   // print(tree);
//   // tree.remove(1);
//   // print('Tree after removal:');
//   // print(tree);
// }

void main() {
  final tree = AvlTree<int>();
  tree.insert(15);
  tree.insert(10);
  tree.insert(16);
  tree.insert(18);
  tree.insert(20);
  print(tree);
  tree.remove(10);
  print(tree);
}

bool isEqual(BinarySearchThree firstBSTTree, BinarySearchThree secondBSTTree) {
  return _isEqual(firstBSTTree.root, secondBSTTree.root);
}

bool _isEqual(BinaryNode? firstBSTTree, BinaryNode? secondBSTTree) {
  if (firstBSTTree == null || secondBSTTree == null) {
    return firstBSTTree == null && secondBSTTree == null;
  }

  return firstBSTTree.value == secondBSTTree.value &&
      _isEqual(
        firstBSTTree.leftChild,
        secondBSTTree.leftChild,
      ) &&
      _isEqual(
        firstBSTTree.rightChild,
        secondBSTTree.rightChild,
      );
}

BinarySearchThree<int> buildExampleTree() {
  var tree = BinarySearchThree<int>();
  tree.insert(3);
  tree.insert(1);
  tree.insert(4);
  tree.insert(1);
  tree.insert(2);
  tree.insert(5);

  return tree;
}

BinarySearchThree<int> buildExampleTreeSecond() {
  var tree = BinarySearchThree<int>();
  tree.insert(3);
  tree.insert(1);
  tree.insert(4);
  tree.insert(0);
  tree.insert(2);
  tree.insert(5);

  return tree;
}

BinaryNode<T>? deserialize<T>(List<T?> list) {
  if (list.isEmpty) return null;

  final value = list.removeLast();
  if (value == null) return null;

  final node = BinaryNode<T>(value);
  node.leftChild = deserialize(list);
  node.rightChild = deserialize(list);

  return node;
}

BinaryNode<T>? deserializeHelper<T>(List<T?> list) {
  return deserialize(list.reversed.toList());
}

List<T?> serialize<T>(BinaryNode<T> node) {
  final list = <T?>[];
  node.traversePreOrderWithNull((value) => list.add(value));
  return list;
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

TreeNode<int> makeNumberTree() {
  final tree = TreeNode(15);
  final secondLevel = TreeNode(1);
  final secondLevel2 = TreeNode(17);
  final secondLevel3 = TreeNode(20);

  final thirLevel = TreeNode(1);
  final thirLevel2 = TreeNode(5);
  final thirLevel3 = TreeNode(0);

  final thirdLevel4 = TreeNode(2);
  final thirdLevel5 = TreeNode(7);

  final thirdLevel6 = TreeNode(5);

  tree.children.add(secondLevel);
  tree.children.add(secondLevel2);
  tree.children.add(secondLevel3);

  secondLevel.children.add(thirLevel);
  secondLevel.children.add(thirLevel2);
  secondLevel.children.add(thirLevel3);

  secondLevel2.children.add(thirdLevel4);
  secondLevel3.children.add(thirdLevel5);
  secondLevel3.children.add(thirdLevel6);

  return tree;
}

TreeNode<String> makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);

  return tree;
}

void printInReverse<E>(List<E> list) {
  var stack = Stack<E>();

  for (E value in list) {
    stack.push(value);
  }

  while (stack.isNotEmpty) {
    print(stack.pop());
  }
}

bool checkParentheses(String text) {
  var stack = Stack<int>();

  final open = '('.codeUnitAt(0);
  final close = ')'.codeUnitAt(0);

  for (int codeUnit in text.codeUnits) {
    if (codeUnit == open) {
      stack.push(codeUnit);
    } else if (codeUnit == close) {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }

  return stack.isEmpty;
}

int sumFromOneTo(int n) {
  var sum = 0;
  for (var i = 1; i <= n; i++) {
    sum += i;
  }

  return sum;
}

int betterOne(int n) {
  return n * (n + 1) ~/ 2;
}

void betterNaiveContains(int value, List<int> list) {
  if (list.isEmpty) return;
  final middleIndex = list.length ~/ 2;

  print(middleIndex);
}

void printNodesRecursively<T>(Node<T>? node) {
  if (node == null) return;

  printNodesRecursively(node.next);

  print(node.value);
}

void printListInReverse<E>(LinkedList<E> list) {
  printNodesRecursively(list.head);
}

Node<E>? getMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}
