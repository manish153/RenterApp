package com.company.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="Service_Contact_Type")
public class ServiceContactType {
	private Integer service_contact_type_id;
	private String service_contact_type_name;
	private String service_contact_type_desc;
	
	@Id
	@Column(name="service_contact_type_id")
	@GeneratedValue
	public Integer getService_contact_type_id() {
		return service_contact_type_id;
	}
	
	public void setService_contact_type_id(Integer service_contact_type_id) {
		this.service_contact_type_id = service_contact_type_id;
	}
	
	@Column(columnDefinition="nvarchar")
	public String getService_contact_type_name() {
		return service_contact_type_name;
	}
	public void setService_contact_type_name(String service_contact_type_name) {
		this.service_contact_type_name = service_contact_type_name;
	}
	
	@Column(columnDefinition="nvarchar")
	public String getService_contact_type_desc() {
		return service_contact_type_desc;
	}
	public void setService_contact_type_desc(String service_contact_type_desc) {
		this.service_contact_type_desc = service_contact_type_desc;
	}	
}
