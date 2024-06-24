package com.MinhHieu.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "hoadonct")
public class hoadonct {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idHdct")
	private int idHdct;

	@ManyToOne
	@JoinColumn(name = "hoadon_id")
	private Hoadon hoadon;
	private int soluong;
	@ManyToOne
	@JoinColumn(name = "productId")
	private Product product;
}
