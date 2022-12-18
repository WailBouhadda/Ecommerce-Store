
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
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="index.jsp">Home</a>
                            <a href="./index.html">Checkout</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
  
    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Continue Shopping? <a href="shop.jsp">Click here</a>
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="checkout" method="post">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Account Email<span>*</span></p>
                                        <input type="email" name="email" required>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Account Password<span>*</span></p>
                                        <input type="password" name="password" required>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input type="text" name="country" required>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" name="adress" placeholder="Address" class="checkout__input__add" required>
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text" name="zipcode" required>
                            </div>
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text" name="notes" value=" "
                                    placeholder="Notes about your order, e.g. special notes for delivery." >
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                	<% 
                            		for(Integer[] pr : cart.getProducts()){
                            			phone p = pdao.getPhoneById(pr[0]);
                            		%>
                                    <li><%=p.getName() %> <span>$<%=p.getPrice()*pr[1]%></span></li>
                                    <%} %>
                                </ul>
                                <div class="checkout__order__subtotal">Subtotal <span>$<%=cart.getTotal() %></span></div>
                                <div class="checkout__order__total">Total <span>$<%=cart.getTotal() %></span></div>
                                <button type="submit" class="site-btn" name="placeorder" value="place">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
  



<jsp:include page="footer.jsp"></jsp:include>    
