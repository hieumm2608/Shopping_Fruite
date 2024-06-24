package com.MinhHieu.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.MinhHieu.model.hoadonct;

@Repository
public interface hoadonctDao extends JpaRepository<hoadonct, Integer> {
	@Query("select h from hoadonct h inner join products p on h.product_id = p.product_id where h.hoadon_id = ?1")
	List<Object> findByIdhd(int id);
}
