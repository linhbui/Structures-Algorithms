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
