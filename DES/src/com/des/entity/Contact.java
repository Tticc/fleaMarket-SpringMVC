package com.des.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Component
@Entity						//该注释指定这个类是一个实体Bean
@Table(name="CONTACTS")		//该注释绑定表 contacts 若只有 @Table 则默认为表名与类名相同
public class Contact {
	 @Id
	 @Column(name="ID")
	 @GeneratedValue
	 private Integer id;
	 @Column(name="FIRSTNAME")
	 private String firstname;
	 @Column(name="LASTNAME")
	 private String lastname;
	 @Column(name="EMAIL")
	 private String email;
	 @Column(name="TELEPHONE")
	 private String telephone;
	 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
}
