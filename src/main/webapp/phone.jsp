
<jsp:include page="header.jsp"></jsp:include>    


  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.phone"%>
  <%@page import="dao.phoneDAO"%>
  
<%

int id = Integer.parseInt(request.getParameter("id"));

HttpSession ss = request.getSession();

phoneDAO pdao = new phoneDAO();


phone p = pdao.getPhoneById(id);

categorieDAO cdao = new categorieDAO();

ArrayList<categorie> categos = cdao.getcategories();

categorie c = cdao.getcategorieById(p.getCategorie());





	if(p != null){	
			
		
			
%>

	              </div>
            </div>
    </section>
    <!-- Hero Section End -->

	

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><%=p.getName() %></h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="./index.html"><%=c.getName() %></a>
                            <span><%=p.getName() %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="phones/<%=p.getImage() %>" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                        <%for(int i = 0 ; i<5 ; i++){ %>
                            <img data-imgbigurl="phones/<%=p.getImage() %>"
                                src="phones/<%=p.getImage() %>" alt="">
                        <%} %>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%=p.getName() %></h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price">$<%=p.getPrice() %></div>
                        <p><%=p.getDetails() %></p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
    
    <%
    	
    ArrayList<phone> phones = pdao.getPhonesByCategorieId(p.getCategorie());
    
    
    if(phones != null){	

    
    %>

	    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
           			 <% 
			
									for(int i = 0 ; i < phones.size() ; i++){
										phone p1 = new phone();
										p1 = phones.get(i);
												
						%>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="phones/<%=p1.getImage() %>">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="phone.jsp?id=<%=p1.getId()%>"><%=p1.getName() %></a></h6>
                            <h5>$<%=p1.getPrice() %></h5>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
	

		<%} %>

	<%}else{ %>
	
			<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
			
	<%} %>









<jsp:include page="footer.jsp"></jsp:include>    
