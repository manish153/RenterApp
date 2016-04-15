package com.company.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name ="Service_Contact")
public class ServiceContact {
	
	private Integer service_contact_id;
	private String contact_first_name;
	private String contact_last_name;
	private String title;
	private int phone_no;
	private String contact_email;
	private ServiceContactType service_contact_type_id;
	private Date created_date_ts;
	private Date last_updated_date_ts;
	
	@Id
	@Column(name="service_contact_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getService_contact_id() {
		return service_contact_id;
	}
	public void setService_contact_id(Integer service_contact_id) {
		this.service_contact_id = service_contact_id;
	}
	
	@Column(columnDefinition="nvarchar")
	public String getContact_first_name() {
		return contact_first_name;
	}
	public void setContact_first_name(String contact_first_name) {
		this.contact_first_name = contact_first_name;
	}
	
	@Column(columnDefinition="nvarchar")
	public String getContact_last_name() {
		return contact_last_name;
	}
	public void setContact_last_name(String contact_last_name) {
		this.contact_last_name = contact_last_name;
	}
	
	@Column(columnDefinition="nvarchar")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPhone_no() {
		return phone_no;
	}
	
	public void setPhone_no(int phone_no) {
		this.phone_no = phone_no;
	}
	
	@Column(columnDefinition="nvarchar")
	public String getContact_email() {
		return contact_email;
	}
	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}
	
	@OneToOne(cascade = CascadeType.ALL, targetEntity = ServiceContactType.class)
	@JoinColumn(name="service_contact_type_id", nullable=false)
	public ServiceContactType getService_contact_type_id() {
		return service_contact_type_id;
	}
	public void setService_contact_type_id(ServiceContactType service_contact_type_id) {
		this.service_contact_type_id = service_contact_type_id;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name ="created_date_ts")
	public Date getCreated_date_ts() {
		return created_date_ts;
	}
	public void setCreated_date_ts(Date created_date_ts) {
		this.created_date_ts = created_date_ts;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_updated_date_ts")
	public Date getLast_updated_date_ts() {
		return last_updated_date_ts;
	}
	public void setLast_updated_date_ts(Date last_updated_date_ts) {
		this.last_updated_date_ts = last_updated_date_ts;
	}	
}

