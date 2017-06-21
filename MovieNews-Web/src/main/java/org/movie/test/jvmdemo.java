package org.movie.test;

import java.util.ArrayList;
import java.util.List;

public class jvmdemo
{
    public static void main(String [] args)
    {
        List list=new ArrayList<int[]>();
        while(true){
          int[] tmp=new int[1000];
          list.add(tmp);
        }
    }
}
