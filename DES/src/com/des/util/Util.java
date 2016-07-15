package com.des.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.des.entity.Comment;


//import org.springframework.stereotype.Component;

//@Component
public class Util {
	public static String getFormatDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
	public static String getFormatDateAll(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	
	//øÏ≈≈
	public static  void quickSort(Comment[] com){
		subQuickSort(com,0,com.length-1);
	}
	private static void subQuickSort(Comment[] array, int start, int end) {  
		if (array == null || (end - start + 1) < 2) {  
			return;  
		}
        int part = partition(array, start, end);  
        if (part == start) {  
            subQuickSort(array, part + 1, end);  
        } else if (part == end) {  
            subQuickSort(array, start, part - 1);  
        } else {  
            subQuickSort(array, start, part - 1);  
            subQuickSort(array, part + 1, end);  
        } 
	}
	private static int partition(Comment[] array, int start, int end) {
		Comment value = array[end];
		int index = start - 1;
		for (int i = start; i < end; i++) {
			if (array[i].getCommentTime().compareTo(value.getCommentTime()) <= 0) {
				index++;
				if (index != i) {
					exchangeElements(array, index, i);
				}
			}
		}
		if ((index + 1) != end) {
			exchangeElements(array, index + 1, end);
		}
		return index + 1;
	}
	private static void exchangeElements(Comment[] array, int index1, int index2) {
		Comment temp = array[index1];
		array[index1] = array[index2];
		array[index2] = temp;
	}
}
