package com.MinhHieu.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MinhHieu.model.Users;

@Repository
public interface UserDao extends JpaRepository<Users, Integer>  {
	Page<Users> findAll(Pageable page);
	
//	@Query("select p from users p")
	 Users findByUserName(String username);

//	List<Users> find
	
}
