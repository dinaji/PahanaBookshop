package com.pahanabookshop.model;

public class Bill {
    private int billId;
    private int accountNo;
    private String name;
    private String email;
    private String bookCategory;
    private String bookName;
    private int units;
    private int unitPrice;
    private int total;

    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public int getAccountNo() { return accountNo; }
    public void setAccountNo(int accountNo) { this.accountNo = accountNo; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getBookCategory() { return bookCategory; }
    public void setBookCategory(String bookCategory) { this.bookCategory = bookCategory; }

    public String getBookName() { return bookName; }
    public void setBookName(String bookName) { this.bookName = bookName; }

    public int getUnits() { return units; }
    public void setUnits(int units) { this.units = units; }

    public int getUnitPrice() { return unitPrice; }
    public void setUnitPrice(int unitPrice) { this.unitPrice = unitPrice; }

    public int getTotal() { return total; }
    public void setTotal(int total) { this.total = total; }
}
