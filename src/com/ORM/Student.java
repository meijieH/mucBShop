package com.ORM;

import java.util.HashSet;
import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String pwd;
	private String stdnum;
	private String realname;
	private String grade;
	private String major;
	private Integer balance;
	private Integer level;
	private String email;
	private String phonenumber;
	private String headpic;
	private Set ordersesForBuyerId = new HashSet(0);
	private Set ordersesForSalerId = new HashSet(0);
	private Set books = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String username, String pwd) {
		this.username = username;
		this.pwd = pwd;
	}

	/** full constructor */
	public Student(String username, String pwd, String stdnum, String realname,
			String grade, String major, Integer balance, Integer level,
			String email, String phonenumber, String headpic,
			Set ordersesForBuyerId, Set ordersesForSalerId, Set books) {
		this.username = username;
		this.pwd = pwd;
		this.stdnum = stdnum;
		this.realname = realname;
		this.grade = grade;
		this.major = major;
		this.balance = balance;
		this.level = level;
		this.email = email;
		this.phonenumber = phonenumber;
		this.headpic = headpic;
		this.ordersesForBuyerId = ordersesForBuyerId;
		this.ordersesForSalerId = ordersesForSalerId;
		this.books = books;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getStdnum() {
		return this.stdnum;
	}

	public void setStdnum(String stdnum) {
		this.stdnum = stdnum;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Integer getBalance() {
		return this.balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return this.phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getHeadpic() {
		return this.headpic;
	}

	public void setHeadpic(String headpic) {
		this.headpic = headpic;
	}

	public Set getOrdersesForBuyerId() {
		return this.ordersesForBuyerId;
	}

	public void setOrdersesForBuyerId(Set ordersesForBuyerId) {
		this.ordersesForBuyerId = ordersesForBuyerId;
	}

	public Set getOrdersesForSalerId() {
		return this.ordersesForSalerId;
	}

	public void setOrdersesForSalerId(Set ordersesForSalerId) {
		this.ordersesForSalerId = ordersesForSalerId;
	}

	public Set getBooks() {
		return this.books;
	}

	public void setBooks(Set books) {
		this.books = books;
	}

}