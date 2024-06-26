package com.MinhHieu.dao;

import java.util.Date;
import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.MinhHieu.model.Hoadon;
import com.MinhHieu.model.Users;


@Repository
public interface Hoadondao extends JpaRepository<Hoadon, Integer> {
	List<Hoadon> findByUser(Users u);
	Page<Hoadon> findAll(Pageable page);
	
	@Query("select p from Hoadon p where p.user.userName=?1 and p.ngaytao =?2")
	Page<Hoadon> findAllbyuserNameDate(String username,Date ngaytao,Pageable page);
	
	@Query("select p from Hoadon p where p.user.userName=?1")
	Page<Hoadon> findAllbyuserName(String username,Pageable page);
	
	@Query("select p from Hoadon p where p.ngaytao = ?1")
	Page<Hoadon> findAllbydate(Date ngaytao,Pageable page);
	
}
