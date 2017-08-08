package com.ORM;

import java.util.Date;

/**
 * Shoplist entity. @author MyEclipse Persistence Tools
 */

public class Shoplist implements java.io.Serializable {

	// Fields

	private Integer id;
	private Student student;
	private Book book;
	private Date preshoptime;

	// Constructors

	/** default constructor */
	public Shoplist() {
	}

	/** full constructor */
	public Shoplist(Student student, Book book, Date preshoptime) {
		this.student = student;
		this.book = book;
		this.preshoptime = preshoptime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Date getPreshoptime() {
		return this.preshoptime;
	}

	public void setPreshoptime(Date date) {
		this.preshoptime = date;
	}

	
}