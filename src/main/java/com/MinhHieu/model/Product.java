package com.MinhHieu.model;

import java.io.Serializable;

import org.apache.catalina.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Products")
public class Product implements Serializable {
	@Id
	@Column(name="productId", columnDefinition = ("int"))
	private int productId;
	private String prodcutName;
	private double productPrice;
	private int quanity;
	private String type;
	private boolean avalible;
	private String imgSr;

}
