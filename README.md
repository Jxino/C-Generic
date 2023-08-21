# Generic Data Structures in C

This project provides Generic Map and Generic List implementations that can be used in the C programming language. Generic Map and Generic List are capable of storing various data types.

## Description of Data Structures
The List is an ArrayList, and the Map is a HashMap.
To generically accommodate all data types, data is stored in C's void* type.
To support generic data types, the constructor accepts the size of the data type and a description of the data type as a string.

Data type descriptions can include "i" (int), "c" (char), "s" (string), "p" (pointer), and so on.
In the case of "s" (string), Generic Map and List store a separate copy of the string.

For example, you can create an Integer List as follows: ```List* list = L_CREATE(sizeof(int), "i")```.
A Map with a char key and an int value like this: ```Map* map = M_CREATE(sizeof(char), "c", sizeof(int), "i")```.

## API Functions

Here are the API functions provided for Generic Lists:

* `L_CREATE(size, desc)` - Create a list.
* `L_DESTROY(list)` - Destroy a list.
* `L_ADD(list, elem)` - Add an element to the list.
* `L_FIND(list, elem)` - Find the position of an element in the list.
* `L_REMOVE(list, idx, p_elem_removed)` - Remove the element at index `idx` from the list and retrieve the removed element.
* `L_RETR(list, idx, p_elem_result)` - Retrieve the element at index `idx` from the list.
* `L_INSERT(list, idx, elem)` - Insert an element at index `idx` in the list.
* `L_HAS(list, elem)` - Check if the list contains a specific element.
* `L_DELETE(list, idx)` - Delete the element at index `idx` from the list.
* `L_COUNT(list)` - Get the number of elements in the list.
* `L_SORT(list, compare_f)` - Sort the list using a comparison function.

And here are the API functions provided for Generic Maps:

* `M_CREATE(K_size, K_desc, V_size, V_desc)` - Create a generic map.
* `M_DESTROY(map)` - Destroy a map.
* `M_PUT(map, key, value)` - Add a key-value pair to the map.
* `M_RETR(map, key, p_value)` - Retrieve the value associated with a key from the map.
* `M_HAS(map, key)` - Check if the map contains a specific key.
* `M_ITER(map)` - Create an iterator for the map.
* `I_NEXT(iter)` - Move the iterator to the next item.
* `I_VALUE(iter, p_value)` - Retrieve the value from the iterator.
* `I_KEY(iter, p_key)` - Retrieve the key from the iterator.
* `M_DEL(map, key)` - Delete the item associated with a key from the map.
* `M_COUNT(map)` - Get the number of key-value pairs in the map.
* `M_KEYS(map)` - Get a list of keys in the map.

## API Functions

Here are the API functions provided by Generic List:

- `L_CREATE(size, desc)` -- Create a list.
- `L_DESTROY(list)` -- Destroy the list.
- `L_ADD(list, elem)` -- Add an element to the list.
- `L_FIND(list, elem)` -- Find the position of an element in the list.
- `L_REMOVE(list, idx, p_elem_removed)` -- Remove the element at index `idx` from the list and retrieve the removed element.
- `L_RETR(list, idx, p_elem_result)` -- Retrieve the element at index `idx` from the list.
- `L_INSERT(list, idx, elem)` -- Insert an element at index `idx` in the list.
- `L_HAS(list, elem)` -- Check if the list contains an element.
- `L_DELETE(list, idx)` -- Delete the element at index `idx` in the list.
- `L_COUNT(list)` -- Get the number of elements in the list.
- `L_SORT(list, compare_f)` -- Sort the list.

Here are the API functions provided by Generic Map:

- `M_CREATE(K_size, K_desc, V_size, V_desc)` -- Create a generic map.
- `M_DESTROY(map)` -- Destroy the map.
- `M_PUT(map, key, value)` -- Add a key-value pair to the map.
- `M_RETR(map, key, p_value)` -- Read the value associated with a key from the map.
- `M_HAS(map, key)` -- Check if the map contains a key.
- `M_ITER(map)` -- Create an iterator for the map.
- `I_NEXT(iter)` -- Move the iterator to the next element.
- `I_VALUE(iter, p_value)` -- Read the value from the iterator.
- `I_KEY(iter, p_key)` -- Read the key from the iterator.
- `M_DEL(map, key)` -- Delete an item associated with a key from the map.
- `M_COUNT(map)` -- Get the number of key-value pairs in the map.
- `M_KEYS(map)` -- Get a list of keys in the map.

## Usage Examples

### Integer List
```c
    List* list = L_CREATE(sizeof(int), "i");
    int x = 3;
    L_ADD(list, x); // x should be an lvalue
    L_ADD(list, 7); // !ERROR! You cannot add this way
    int y = 7;
    L_ADD(list, y); // You should add this way. element needs to be a variable that can be pointed by a pointer
    L_DESTROY(list);  
```

### Integer List
```c
    List* list = L_CREATE(sizeof(int), "i");
    int x = 9;
    int y = 3;
    int z = 7;
    L_ADD(list, x);
    L_ADD(list, y);
    L_ADD(list, z);
    int w = 6;
    int idx = L_FIND(list, w); // not found, idx == -1;
    w = 7;
    idx = L_FIND(list, w); // found, idx == 2;
    int r; L_RETR(list, 1, &r); // retrieve second item, r == 3
    L_DELETE(list, 1);
    size_t count = L_COUNT(list); // count == 2
    int u = 5;
    L_INSERT(list, 1, u); // list = [9, 5, 7]
    L_REMOVE(list, 0, &r); // remove first element and fetch into r. r == 9
    if (L_HAS(list, r)) {
        assert(0); // r (9) was already removed
    }
    L_DESTROY(list); 
```

### Sorting an Integer List

To perform sorting, you need to provide a function that compares two elements. Since it's a Generic List, create a `compare` function that accepts `void*` as an argument.

```c
    List* list = L_CREATE(sizeof(int), "i");
    int x = 9;
    int y = 3;
    int z = 7;
    L_ADD(list, x);
    L_ADD(list, y);
    L_ADD(list, z);
    int comp(void* pa, void* pb) { // 
        return *((int*) pa) - *((int*) pb); 
    }
    L_SORT(list, comp);
    L_DESTROY(list);

```

### Operations on String List
TBD.
### List of Struct Pointer
TBD.
### List of Struct
TBD.
### Creating Map of Char key, Int value

```c
    Map* map = M_CREATE(sizeof(char), "c", sizeof(int), "i");
    char k1 = 'A'; int v1 = 3;
    M_PUT(map, k1, v1);
    char k2 = 'C'; int v2 = 7;
    M_PUT(map, k2, v2);
    char k3 = 'C'; int v3 = 9;
    M_PUT(map, k3, v3);
    char k4 = 'B'; int v4 = 1;
    M_PUT(map, k4, v4);
    size_t count = M_COUNT(map); // count == 3
    int r; M_RETR(map, k2, &r); // r == 7
    M_DEL(map, k1); // delete
    List* keys = M_KEYS(map);
    size_t count2 = L_COUNT(keys); // count2 == 2
    L_DESTROY(keys);
    if (M_HAS(map, k1)) {
        assert(0);
    }
    Iterator* iter = M_ITER(map);
    while (I_NEXT(iter) != NULL) {
        char key; I_KEY(iter, &key);
        int value; I_VALUE(iter, &value);
        printf("key = %c, value = %d\n", key, value); 
    }
    M_DESTROY(map);
```