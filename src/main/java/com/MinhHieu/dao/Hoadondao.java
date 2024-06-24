package com.MinhHieu.dao;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MinhHieu.model.Hoadon;
import com.MinhHieu.model.Users;


@Repository
public interface Hoadondao extends JpaRepository<Hoadon, Integer> {
	List<Hoadon> findByUser(Users u);
	Page<Hoadon> findAll(Pageable ppage);
}
