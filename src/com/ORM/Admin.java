package com.ORM;

import java.io.Serializable;

public class Admin implements Serializable {
	
	Integer id;
	String username;
	String pwd;
	Integer priviledge;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Integer getPriviledge() {
		return priviledge;
	}
	public void setPriviledge(Integer priviledge) {
		this.priviledge = priviledge;
	}

}
