package com.MinhHieu.controller;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.MinhHieu.dao.Hoadondao;
import com.MinhHieu.dao.ProductDao;
import com.MinhHieu.dao.UserDao;
import com.MinhHieu.dao.hoadonctDao;
import com.MinhHieu.model.Hoadon;
import com.MinhHieu.model.Product;
import com.MinhHieu.model.Users;
import com.MinhHieu.model.hoadonct;
import com.MinhHieu.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@org.springframework.stereotype.Controller
public class Controller {
	@Autowired
	ProductDao daoP;
	@Autowired
	HttpServletRequest req;
	@Autowired
	UserDao daoU;
	@Autowired
	HttpServletResponse resp;
	@Autowired
	HttpSession hs;
	@Autowired
	Hoadondao daoH;
	@Autowired
	ServletContext application;

	@Autowired
	hoadonctDao daohdct;
	@Autowired
	SessionService session;

	@RequestMapping("/index")
	public String main() {
		return "index";
	}

	@RequestMapping("/404")
	public String notFound() {
		return "404";
	}

	@RequestMapping("/testimonial")
	public String testimonial() {
		return "testimonial";
	}

	@RequestMapping("/chackout")
	public String chackout() {
		return "chackout";
	}

	@RequestMapping("/cart")
	public String cart() {
		return "cart";
	}

	@RequestMapping("/shop-detail")
	public String shopdetail() {
		return "shop-detail";
	}

	@RequestMapping("/shop")
	public String shop() {
		return "shop";
	}

	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("/UserManager")
	public String user(Model model) {
		return "UserManager";
	}

	@PostMapping("/UserManager")
	public String ump(Model model, @RequestParam("emailUm") String email, @RequestParam("fullnameUm") String fullname,
			@RequestParam("addUm") String address) {
		Users u = session.getAttribute("ulg");
		System.out.println(u.toString());
		u.setAddress(address);
		u.setFullname(fullname);
		u.setAddress(address);
		daoU.save(u);
		model.addAttribute("messUm", "thanh cong");
		return "UserManager";
	}

	@RequestMapping("/CartManager")
	public String Cart() {
		return "Cartmanager";
	}

	@RequestMapping("/History")
	public String histrory(Model model) {
		Users u = session.getAttribute("ulg");
		List<Hoadon> listhd = daoH.findByUser(u);
		model.addAttribute("listh", listhd);
		return "History";
	}

	@PostMapping("/statistics")
	public String staPost(Model model, @RequestParam("usernamest") Optional<String> username,
			@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Optional<Date> date) {
		Pageable page = PageRequest.of(0, 5);
		String a = username.orElse(null);
		Date b = date.orElse(null);
		System.out.println(a);
		System.out.println(b);
		List<Users> listu = daoU.findAll();
		model.addAttribute("listu", listu);
		if (a.equals("Username") && b == null) {
			Page<Hoadon> listhd = daoH.findAll(page);
			model.addAttribute("listhd", listhd);
			System.out.println("2");
			return "/statistic";
		} else if (a.equals("Username") || b == null) {
			if (b == null) {
				Page<Hoadon> listhdusername = daoH.findAllbyuserName(a, page);
				model.addAttribute("listhd", listhdusername);
			}
			if (a.equals("Username")) {
				Page<Hoadon> listhdusername = daoH.findAllbydate(b, page);
				model.addAttribute("listhd", listhdusername);
			}
			System.err.println("1");
			return "/statistic";
		} else {
			Page<Hoadon> listhdusername = daoH.findAllbyuserNameDate(username.orElse(null), date.orElse(null), page);
			model.addAttribute("listhd", listhdusername);
			System.out.println("3");

		}

		return "/statistic";

	}

	@RequestMapping("/statistics")
	public String statistics(Model model) {

		Users u = session.getAttribute("ulg");
		if (u != null && u.isRole() == true) {
			List<Users> listu = daoU.findAll();
			model.addAttribute("listu", listu);

			Pageable p = PageRequest.of(0, 5);
			Page<Hoadon> listhd = daoH.findAll(p);
			model.addAttribute("listhd", listhd);
			double tongtien = 0;
			for (Hoadon x : listhd) {
				tongtien += x.getDongia();
			}
			model.addAttribute("tt", tongtien);
			return "/statistic";
		} else {
			return "404";
		}

	}

	@RequestMapping("/CartManager/{id}")
	public String cartid(Model model, @PathVariable("id") int id) {
		List<hoadonct> listhdct = daohdct.findBymahd(id);
		model.addAttribute("listhdct", listhdct);
		return "Cartmanager";
	}

	@PostMapping("/AccountManager")
	public String amP(Model model, @RequestParam("cPass") String pass1, @RequestParam("pass1Am") String pass2,
			@RequestParam("pass2Am") String pass3) {
		Users u = session.getAttribute("ulg");
		if (u.getPassWord().equalsIgnoreCase(pass1)) {
			if (pass2.equalsIgnoreCase(pass3)) {
				u.setPassWord(pass3);
				daoU.save(u);
				model.addAttribute("messAm", "thanh cong");
			} else {
				model.addAttribute("messAm", "mat khau xac nhan khong dung");
			}
		} else {
			model.addAttribute("messAm", "mat khau hien tai khong dung");
		}
		return "AccountManager";

	}

	@RequestMapping("/AccountManager")
	public String AccountManager() {
		Users u = session.getAttribute("ulg");
		if (u != null) {
			return "AccountManager";
		} else {
			return "404";
		}
	}

	@RequestMapping("/ProductManager/page")
	public String ProductManagerpage(Model model, @RequestParam("pp") int i) {
		if (i < 0) {
			Pageable page = PageRequest.of(0, 3);
			Page<Product> listpd = daoP.findAll(page);
			model.addAttribute("listpd", listpd);
		} else {
			Pageable page = PageRequest.of(i, 3);
			Page<Product> listpd = daoP.findAll(page);
			model.addAttribute("listpd", listpd);
		}

		return "Productmanager";
	}

	@PostMapping("/ProductManager/save")
	public String ProductManagersave(Model model, @RequestParam("imgSr") File imgSr,
			@RequestParam("idName") String name, @RequestParam("idSp") int id, @RequestParam("idDongia") double dongia,
			@RequestParam("idCount") int count, @RequestParam("idType") String type,
			@RequestParam("idStt") String stt) {
		Product pro = daoP.findByIdPr(id);
		if (pro == null) {
			Product newPro = new Product();

			newPro.setProductId(id);
			newPro.setProdcutName(name);
			newPro.setQuanity(count);
			if (type.equals("1")) {
				newPro.setType("fruit");
			} else if (type.equals("2")) {
				newPro.setType("vegetable");
			} else {
				newPro.setType("bean");
			}
			if (stt.equals("1")) {
				newPro.setAvalible(true);
			} else {
				newPro.setAvalible(false);
			}
			newPro.setImgSr("null");
			newPro.setProductPrice(dongia);

			if (imgSr != null) {

				newPro.setImgSr(imgSr.getName());

			} else {
				newPro.setImgSr("null");
			}

			daoP.save(newPro);
			model.addAttribute("messPd", "Tao san pham moi thanh cong");
		} else {
			pro.setProductId(id);
			pro.setProdcutName(name);
			pro.setQuanity(count);
			pro.setType(type);
			if (stt.equals("1")) {
				pro.setAvalible(true);
			} else {
				pro.setAvalible(false);
			}
			if (type.equals("1")) {
				pro.setType("fruit");
			} else if (type.equals("2")) {
				pro.setType("vegetable");
			} else {
				pro.setType("bean");
			}

			if (imgSr != null) {
				try {
					pro.setImgSr(imgSr.getName());
					model.addAttribute("messPd", imgSr.getName());
				} catch (Exception e) {
					model.addAttribute("messPd", "cap nhat hinh that bai");
				}
			}
			pro.setProductPrice(dongia);
			daoP.save(pro);

		}
		return "redirect:/ProductManager";
	}

	@RequestMapping("/ProductManager")
	public String ProductManager(Model model) {
		Users u = session.getAttribute("ulg");
		if (u != null && u.isRole() == true) {
			Pageable page = PageRequest.of(0, 3);
			Page<Product> listpd = daoP.findAll(page);
			model.addAttribute("listpd", listpd);
			return "Productmanager";
		} else {
			return "404";
		}

	}

	@RequestMapping("/ProductManager/{id}")
	public String ProductManagerId(Model model, @PathVariable("id") int id, @RequestParam("pp") Optional<Integer> p) {
		Product c = daoP.findByIdPr(id);
		model.addAttribute("pro", c);
		Pageable page = PageRequest.of(p.orElse(0), 3);
		Page<Product> listpd = daoP.findAll(page);
		model.addAttribute("listpd", listpd);

		return "Productmanager";
	}

	@RequestMapping("/Admin/save")
	public String adminSave(Model model, @RequestParam("userIdAdmin") Integer id,
			@RequestParam("fullnameAdmin") String name, @RequestParam("addressAdmin") String add,
			@RequestParam("usernameAdmin") String username, @RequestParam("roleAd") String role) {
		Users u = daoU.findById(id).get();
		u.setFullname(name);
		u.setAddress(add);
		u.setUserName(username);
		if (role.equals("admin")) {
			u.setRole(true);
		} else {
			u.setRole(false);
		}
		daoU.save(u);

		List<Users> listU = daoU.findAll();
		model.addAttribute("listUser", listU);
		return "redirect:/Admin";
	}

	@RequestMapping("/Admin")
	public String search1(Model model, @RequestParam("p") Optional<Integer> p) {
		Users u = session.getAttribute("ulg");
		if (u != null && u.isRole() == true) {
			Pageable page = PageRequest.of(0, 3);
			Page<Users> listUser = daoU.findAll(page);
			model.addAttribute("page", listUser);
			return "adminUser";
		} else {
			return "404";
		}

	}

	@PostMapping("/ProductManager/delete")
	public String deletePm(Model model, @RequestParam("idSp") int id) {
		Product product;
		try {
			product = daoP.findByIdPr(id);
			daoP.delete(product);
		} catch (Exception e) {
			model.addAttribute("messPd", "khong tim thay id");
		}
		return "forward:/ProductManager";
	}

	@RequestMapping("/Admin/{id}")
	public String edit(Model model, @PathVariable("id") int id, @RequestParam("p") Optional<Integer> p) {
		Users u = daoU.findById(id).get();
		model.addAttribute("u", u);
		Pageable page = PageRequest.of(p.orElse(0), 3);
		Page<Users> listUser = daoU.findAll(page);
		model.addAttribute("page", listUser);
		return "adminUser";
	}

	@RequestMapping("/Admin/page")
	public String search(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable page = PageRequest.of(p.orElse(0), 3);
		Page<Users> listUser = daoU.findAll(page);
		model.addAttribute("page", listUser);
		return "adminUser";
	}

	@GetMapping("/login")
	public String login() {

		hs.removeAttribute("ulg");
		return "login";
	}

	@PostMapping("/login")
	public String loginP(Model model, @RequestParam("userNameLg") String tk, @RequestParam("passLg") String pass) {
		Users u = daoU.findByUserName(tk);
		if (u == null) {
			model.addAttribute("message", "khong tim thay username");
			return "login";
		} else {
			if (!pass.equals(u.getPassWord())) {
				model.addAttribute("message", "sai mat khau");
				return "login";
			} else {
				hs.setAttribute("ulg", u);
				return "index";
			}
		}
	}

	@PostMapping("/signup")
	public String signup2(Model model, @RequestParam("userNameSu") String usename,
			@RequestParam("fullNameSu") String fullname, @RequestParam("passSu") String pass1,
			@RequestParam("passLSu2") String pass2, @RequestParam("emailSu") String email,
			@RequestParam("addSu") String address) {
		Users u = new Users();
		u.setUserName(usename);
		u.setFullname(fullname);
		u.setPassWord(pass2);
		u.setEmail(email);
		u.setAddress(address);

		List<Users> list = daoU.findAll();
		for (Users x : list) {
			if (x.getUserName().equals(usename)) {
				model.addAttribute("messSu", "Username da ton tai");
				return "signup";
			}
		}
		if (!pass1.equalsIgnoreCase(pass2)) {
			System.out.println(pass1);
			System.out.println(pass2);
			model.addAttribute("messSu", "mat khau xac nhan khong chinh xac");
			return "signup";
		} else {
			try {
				daoU.save(u);
				model.addAttribute("messSu", "thanh cong");
				return "signup";
			} catch (Exception e) {
				model.addAttribute("messSu", "that bai");
				return "signup";
			}
		}

	}

	@PostMapping("/Admin/delete")
	public String delete(Model model, @RequestParam("userIdAdmin") Integer id) {
		Users u = daoU.findById(id).get();
		if (u == null) {
			System.out.println("khong tim thay id");
			model.addAttribute("messAd", "khong tim thay id");
		} else {
			try {
				daoU.delete(u);
				System.out.println("thanh cong");
				model.addAttribute("messAd", "thanh cong");

			} catch (Exception e) {
				System.out.println("that bai");
			}
		}

		return "forward:/Admin";
	}

	@GetMapping("/signup")
	public String signup() {

		return "signup";
	}

}
