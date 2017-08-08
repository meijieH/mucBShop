package com.ORM;

import java.util.Date;

/**
 * CreditTransfer entity. @author MyEclipse Persistence Tools
 */

public class CreditTransfer implements java.io.Serializable {

	// Fields

	private Integer id;
	private Student studentByFrom;
	private Student studentByTo;
	private Date date;
	private String info;
	private Integer credit;

	// Constructors

	public Integer getCredit() {
		return credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	/** default constructor */
	public CreditTransfer() {
	}

	/** full constructor */
	public CreditTransfer(Student studentByFrom, Student studentByTo,Integer credit,
			Date date, String info) {
		this.studentByFrom = studentByFrom;
		this.studentByTo = studentByTo;
		this.credit=credit;
		this.date = date;
		this.info = info;
		
		System.out.println("from_id:"+studentByFrom.getId()+"to_id:"+studentByTo.getId());
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudentByFrom() {
		return this.studentByFrom;
	}

	public void setStudentByFrom(Student studentByFrom) {
		this.studentByFrom = studentByFrom;
	}

	public Student getStudentByTo() {
		return this.studentByTo;
	}

	public void setStudentByTo(Student studentByTo) {
		this.studentByTo = studentByTo;
	}

	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

}