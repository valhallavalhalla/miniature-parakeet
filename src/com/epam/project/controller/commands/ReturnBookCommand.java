package com.epam.project.controller.commands;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.epam.project.model.BookService;
import com.epam.project.model.OrderService;
import com.epam.project.model.entities.User;

public class ReturnBookCommand implements Command{
	
	private BookService bookService = BookService.getInstance();
	private OrderService orderService = OrderService.getInstance();

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		int bookId = Integer.valueOf(request.getParameter("idBook"));
		int orderId = Integer.valueOf(request.getParameter("idOrder"));
		orderService.returnBook(user, bookId, orderId);
		return CommandList.PROFILE.getCommand().execute(request, response);
		
	}

}
