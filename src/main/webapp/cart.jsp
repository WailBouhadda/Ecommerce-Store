
<jsp:include page="header.jsp"></jsp:include>    


  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.phone"%>
  <%@page import="dao.phoneDAO"%>
    <%@page import="entities.client"%>
  <%@page import="entities.cart"%>
<%

phoneDAO pdao = new phoneDAO();

categorieDAO cdao = new categorieDAO();

ArrayList<categorie> categos = cdao.getcategories();



session.setAttribute("source","cart.jsp");

cart cart = (cart)session.getAttribute("cart");


			
%>

	              </div>
            </div>
    </section>
    <!-- Hero Section End -->

	

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="index.jsp">Home</a>
                            <span>Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    
 <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                <%
            		if(cart != null){	
        					
            	%>
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<% 
                            	
                            		for(Integer[] pr : cart.getProducts()){
                            			phone p = pdao.getPhoneById(pr[0]);
                            	%>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="phones/<%=p.getImage() %>" alt="">
                                        <h5><%=p.getName() %></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $<%=p.getPrice() %>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <%=pr[1] %>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $ <%=p.getPrice()*pr[1] %>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <a href="removeFromCart?id=<%=pr[0] %>"><span class="icon_close"></span></a>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                   <%} %>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="index.jsp" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$<%=cart.getTotal() %></span></li>
                            <li>Total <span>$<%=cart.getTotal() %></span></li>
                        </ul>
                        <a href="checkout.jsp" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->





<jsp:include page="footer.jsp"></jsp:include>    
