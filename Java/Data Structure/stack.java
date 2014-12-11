/* implement three stacks in a single array */
int[] stacks = new int[100]; 
int[] pointers = [-1, Math.floor(stacks.length/3) - 1, Math.floor(2*stacks.length/3) - 1];
int[] tops =  [0, Math.floor(stacks.length/3), Math.floor(2*stacks.length/3)];

void push(int stackNum, int el) {
    int index = pointers[stackNum -1];
    if ((index + 1 == 100) || (index == pointers[stackNum])) {
        throw new FullStackException();
    } 
    stacks[index + 1] = el;
    pointers[stackNum - 1] += 1;
}

int pop(int stackNum) {
    int index = pointers[stackNum -1];
    if (index < tops[stackNum -1]) {
        throw new EmptyStackException();
    }
    int el = stacks[index];
    stacks[index] = null;
    pointers[stackNum - 1]--;
    return el;
}

int peek(int stackNum) {
    int index = pointers[stackNum - 1];
    if (index < tops[stackNum -1]) {
        throw new EmptyStackException();
    }
    return stacks[index];
}


/* implement a stack that also return the minimum element */
import java.util.List;
import java.util.ArrayList;

class Stack {
    Node top;
    List<Integer> minArray = new ArrayList(); 
    Node pop() {
        if (top != null) {
            Object el = top.data;
            top = top.next;
            minArray.pop();
            return el;
        }
        return null;
    } 

    void push(Object el) {
        Node nextNode = new Node(el);
        if ((minArray.size == 0) || (el < minArray.get(minArray.size -1)) {
            minArray.push(el);
        } else {
            minArray.push(minArray.get(minArray.size -1));
        }
        nextNode.next = top;
        top = nextNode;
    }

    int min() {
        return minArray.get(minArray.size -1);
    }
}

/* SetOfStacks: compose of several stacks, create a new stack once the previous one exceeds capacity */
class SetOfStacks {
    ArrayList<Stack> stacks = new ArrayList<Stack>();
    public int pop() {
        if (top != null) {
            Object el = top.data;
            top = top.next;
            return el;
        }
        return null;
    } 

    public void push(int el) {
        Stack lastStack = getLastStack();
        if (lastStack!= null && !last.isFull()) {
            lastStack.push(el);
        } else {
            Stack stack = new Stack(capacity);
            stack.push(v);
            stacks.add(stack);
        }
    }

    public void add(Stack stack) {
        stacks.push(stack);
    }

    public Stack getLastStack() {
        return stacks.get(stacks.size -1);
    }

    public void isFull() {
        
    }
}
