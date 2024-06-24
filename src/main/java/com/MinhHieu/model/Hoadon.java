package com.MinhHieu.model;

import java.util.Date;
import java.util.List;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="hoadon")
public class Hoadon {
	@Column(name="mahd")
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	double dongia;
	@Column(name="trangthai")
	boolean stt;
	@Temporal(TemporalType.DATE)
	@Column(name="createDate")
	Date ngaytao = new Date();
	
	@OneToMany(mappedBy = "hoadon")
	List<hoadonct> listhdct;
	
	@ManyToOne 
	@JoinColumn(name="nguoitao")
	Users user;
	
	
	
	
}
