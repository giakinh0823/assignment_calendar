/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.common;

import java.util.ArrayList;

/**
 *
 * @author giaki
 */
public class Pagination {

    private int pageIndex = 1;
    private int pageSize = 12;
    private int prev;
    private int next;
    private int count;
    private int size;

    public Pagination() {
    }
    
    public Pagination(int pageIndex,int pageSize, int size) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.size = size;
        upDateCount();
        this.next = Math.min(this.pageIndex + 1, this.count);
        this.prev = Math.max(1, this.pageIndex - 1);
    }
    
    public void upDateCount() {
        int count = (int) Math.ceil((double) this.size / pageSize);
        this.count = count > 0 ? count : 1;
    }

    public void setSize(int size) {
        this.size = size;
        upDateCount();
    }
    
    public int getSize() {
        return this.size;
    }


    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex <= 0 ? 1 : pageIndex <= count ? pageIndex : count;
        this.next = Math.min(this.pageIndex + 1, count);
        this.prev = Math.max(1, this.pageIndex - 1);
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
        upDateCount();
    }

    public int getPrev() {
        return prev;
    }

    public int getNext() {
        return next;
    }

    public int getCount() {
        return count;
    }
}
