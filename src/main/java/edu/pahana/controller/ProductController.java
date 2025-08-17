package edu.pahana.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.pahana.model.Product;
import edu.pahana.service.ProductService;

@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService productService;
	
	public void init() throws ServletException {
		productService = ProductService.getInstance();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String action = request.getParameter("action");
	        if (action == null || action.isEmpty()) {
	            action = "list";
	        }
	        
	        switch (action) {
	            case "list":
	                listProducts(request, response);
	                break;
	            case "add":
	                showAddForm(request, response);
	                break;
	            case "view":
	                viewProduct(request, response);
	                break;
	            case "edit":
	                showEditForm(request, response);
	                break;
	            case "delete":
	                deleteProduct(request, response);
	                break;
	            default:
	                listProducts(request, response);
	                break;
	        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String action = request.getParameter("action");
	        if (action.equals("add")) {
	            addProduct(request, response);
	        } else if (action.equals("update")) {
	            updateProduct(request, response);
	        }
	}
	
	 private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
	 IOException {
			
	    	List<Product> productList = new ArrayList<Product>();
			try {
				String searchTerm = request.getParameter("search");
				if (searchTerm != null && !searchTerm.trim().isEmpty()) {
					productList = productService.searchProducts(searchTerm.trim());
				} else {
					productList = productService.getAllProducts();
				}
				request.setAttribute("products", productList);
			} catch ( SQLException e) {
				request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	            return;
			}
	    	
	        request.getRequestDispatcher("WEB-INF/view/listProducts.jsp").forward(request, response);
	    }

	    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getRequestDispatcher("WEB-INF/view/addProduct.jsp").forward(request, response);
	    }

	    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String description = request.getParameter("description");
	        int quantity = Integer.parseInt(request.getParameter("quantity"));
	        
	        Product product = new Product();
	        product.setName(name);
	        product.setPrice(price);
	        product.setDescription(description);
	        product.setQuantity(quantity);
	        
	        try {
	            productService.addProduct(product);
	            response.sendRedirect("product?action=list");
	        } catch (SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	        }
	    }
	    
	    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("id"));
	        try {
	            Product product = productService.getProductById(productId);
	            request.setAttribute("product", product);
	            request.getRequestDispatcher("WEB-INF/view/viewProduct.jsp").forward(request, response);
	        } catch (SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	        }
	    }
	    
	    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("id"));
	        try {
	            Product product = productService.getProductById(productId);
	            request.setAttribute("product", product);
	            request.getRequestDispatcher("WEB-INF/view/editProduct.jsp").forward(request, response);
	        } catch (SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	        }
	    }
	    
	    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String description = request.getParameter("description");
	        int quantity = Integer.parseInt(request.getParameter("quantity"));
	        
	        Product product = new Product(productId, name, description, price, quantity);
	        
	        try {
	            productService.updateProduct(product);
	            response.sendRedirect("product?action=list");
	        } catch (SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	        }
	    }
	    
	    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("id"));
	        try {
	            productService.deleteProduct(productId);
	            response.sendRedirect("product?action=list");
	        } catch (SQLException e) {
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
	        }
	    }
}
