package com.ORM;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */

public class Book implements java.io.Serializable {

	// Fields

	private Integer id;
	private Student student;
	private String name;
	private String author;
	private Integer price;
	private String type;
	private String pic;//图片可以用string来存储吗？
	private String state;
	private String press;
	private String subject;
	private Timestamp subtime;
	private Set orderses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(Student student, String name, String author, Integer price,
			String type, String pic, String state, String press,
			String subject, Timestamp subtime, Set orderses) {
		this.student = student;
		this.name = name;
		this.author = author;
		this.price = price;
		this.type = type;
		this.pic = pic;
		this.state = state;
		this.press = press;
		this.subject = subject;
		this.subtime = subtime;
		this.orderses = orderses;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPress() {
		return this.press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Timestamp getSubtime() {
		return this.subtime;
	}

	public void setSubtime(Timestamp subtime) {
		this.subtime = subtime;
	}

	public Set getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set orderses) {
		this.orderses = orderses;
	}

}