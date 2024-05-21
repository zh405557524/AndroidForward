//
// Created by sou'l on 2024/5/17.
//

#include "T1.h"


void T1::main() {

    int arr1[5] = {1, 2, 3, 4, 5};
    int arr2[5] = {11, 22, 33, 44, 55};
    int arr3[5] = {111, 222, 333, 444, 555};

    //指针数组 重点是关系后面连个字，数组.以数字为中心得指针。

    int *pArr[3];
    *(pArr + 0) = arr1;//元素1,int * = arr1 首元素指针(指向arr1得第一给元素得地址)
    *(pArr + 1) = arr2;//元素2,int * = arr2 首元素指针(指向arr2得第一给元素得地址)
    *(pArr + 2) = arr3;//元素3,int * = arr3 首元素指针(指向arr3得第一给元素得地址)

    LOGI("pArr:sizeof:%d", sizeof pArr)// 8arm64 ; 4 arm32
    LOGI("arr:sizeof:%d", sizeof arr1)//20 它没有退化成指针
    LOGI("sizeof(int*):%d", sizeof(int *))//8 arm64 4 arm32
    LOGI("ziseof(void*):%d", sizeof(void *))//8 arm64 ;4arm32

    LOGI("ziseof( sizieof(pArr[0])):%d", sizeof(pArr[0]))//arr1 已经退化成指针了。8 arm64 ;4arm32
    for (int i = 0; i < sizeof(pArr) / 8; ++i) {//循环三次
        int **pp = pArr + i;// i0 i1 i2
        for (int j = 0; j < sizeof(arr1) / sizeof(int); ++i) {//循环5次
            //*pp 之后得类型  int*  == 取出 aar1  取出 aar2 取出 aar3
            //pp 是二级指针 *pp 是一级指针。
            LOGI("数据是:%d", *(*pp + j)) //指针优先级 从内到外
            int *p = *pp;//int *p = arr1 arr2 arr3
            LOGI("数据是%d", p[j])
        }
    }

    int a;
    int *p0 = &a;//指针

    int *p1 = arr1;//退化成指针,= &arr1[0] 首元素的地址 赋值

    //数组指针 重点是指针。以指针为重的数组。
    int i1 = 100;//字节的内存地址 1000H只有一份，值100
    int *z1 = &i1;
    int **z2 = &z1;//自己的内存地址2000H 只有一份，值也是一分内存地址1000H
    int ***z3 = &z2;

}