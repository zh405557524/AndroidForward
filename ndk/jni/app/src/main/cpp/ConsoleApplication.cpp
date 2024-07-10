//
// Created by sou'l on 2024/7/5.
//

#include <iostream>
#include "stdio.h"

struct Soul {
    int val = 0;

    Soul &add(int value) {
        val += value;
        return *this;
    }

};


int main() {
    Soul soul;
    soul.add(1).add(2).add(3);


    //1、指针可以任意嵌套，引用很难嵌套
    int value = 666;
    int *ptr1 = &value;
    int **ptr2 = &ptr1;
    int ***ptr3 = &ptr2;

    std::cout << "ptr1 = " << ptr1 << std::endl;

    //2、指针可以更灵活 迭代 数组，数组结合指针 是指针的首选
    int arr[] = {1, 2, 3, 4, 5};
    for (int *ptr = arr; ptr < arr + 3; ptr++) {
        std::cout << "ptr = " << *ptr << std::endl;
    }

    //3、指针可以存入到数组中
    int n1 = 100, n2 = 200, n3 = 300;
    int *ptrArray[] = {&n1, &n2, &n3};
    for (int i = 0; i < 3; i++) {
        std::cout << "ptrArray = " << *ptrArray[i] << std::endl;
    }

}