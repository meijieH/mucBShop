package com.ORM;

/**
 * Appeal entity. @author MyEclipse Persistence Tools
 */

public class Appeal implements java.io.Serializable {

	// Fields

	private Integer id;
	private Student studentByComplainantId;
	private Order order;
	private Student studentByRespondentId;
	private String reason;
	private String reply;
	private String submitTime;
	

	// Constructors

	public String getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	/** default constructor */
	public Appeal() {
	}

	/** minimal constructor */
	public Appeal(Student studentByComplainantId, Order order,
			Student studentByRespondentId) {
		this.studentByComplainantId = studentByComplainantId;
		this.order = order;
		this.studentByRespondentId = studentByRespondentId;
	}

	/** full constructor */
	public Appeal(Student studentByComplainantId, Order order,
			Student studentByRespondentId, String reason) {
		this.studentByComplainantId = studentByComplainantId;
		this.order = order;
		this.studentByRespondentId = studentByRespondentId;
		this.reason = reason;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudentByComplainantId() {
		return this.studentByComplainantId;
	}

	public void setStudentByComplainantId(Student studentByComplainantId) {
		this.studentByComplainantId = studentByComplainantId;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order orders) {
		this.order = orders;
	}

	public Student getStudentByRespondentId() {
		return this.studentByRespondentId;
	}

	public void setStudentByRespondentId(Student studentByRespondentId) {
		this.studentByRespondentId = studentByRespondentId;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}