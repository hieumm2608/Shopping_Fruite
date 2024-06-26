package com.MinhHieu.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.MinhHieu.model.hoadonct;

@Repository
public interface hoadonctDao extends JpaRepository<hoadonct, Integer> {
	@Query("select p from hoadonct p where p.hoadon.id = ?1")
	List<hoadonct> findBymahd(int idHdct);
}
 