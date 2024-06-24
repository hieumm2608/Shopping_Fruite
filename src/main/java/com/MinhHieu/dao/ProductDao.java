package com.MinhHieu.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.MinhHieu.model.Product;

@Repository
public interface ProductDao extends JpaRepository<Product, Integer> {
	Page<Product> findAll(Pageable page);
	Product findByProdcutName(String name);
	@Query("select p from Product p where p.productId = ?1")
	Product findByIdPr(int id);
}
