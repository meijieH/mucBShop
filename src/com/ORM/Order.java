package com.ORM;

import java.util.Date;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer id;
	private Student studentBySalerId;
	private Student studentByBuyerId;
	private Book book;
	private Date subDate;
	
	private Integer count;
	private String state;

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Student studentBySalerId, Student studentByBuyerId, Book book) {
		this.studentBySalerId = studentBySalerId;
		this.studentByBuyerId = studentByBuyerId;
		this.book = book;
	}

	/** full constructor */
	public Order(Student studentBySalerId, Student studentByBuyerId,
			Book book, Date subDate, Integer count, String state) {
		this.studentBySalerId = studentBySalerId;
		this.studentByBuyerId = studentByBuyerId;
		this.book = book;
		this.subDate = subDate;
		this.count = count;
		this.state = state;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudentBySalerId() {
		return this.studentBySalerId;
	}

	public void setStudentBySalerId(Student studentBySalerId) {
		this.studentBySalerId = studentBySalerId;
	}

	public Student getStudentByBuyerId() {
		return this.studentByBuyerId;
	}

	public void setStudentByBuyerId(Student studentByBuyerId) {
		this.studentByBuyerId = studentByBuyerId;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Date getSubDate() {
		return this.subDate;
	}

	public void setSubDate(Date subDate) {
		this.subDate = subDate;
	}

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}