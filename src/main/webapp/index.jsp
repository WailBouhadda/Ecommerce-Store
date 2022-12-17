

<jsp:include page="header.jsp"></jsp:include>    


  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.phone"%>
  <%@page import="dao.phoneDAO"%>
  
<%
	
	categorieDAO cdao = new categorieDAO();
	
	ArrayList<categorie> categos = cdao.getcategories();
	
	phoneDAO pdao = new phoneDAO();


	ArrayList<phone> phones = pdao.getPhones();

	
%>
 




                    <div class="hero__item set-bg " data-setbg="img/hero/banner.png">
                        <div class="hero__text">
                            <span>SAMSUNG</span>
                            <h2>Galaxy <br />S21 FE 5G</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
              	</div>
            </div>
    </section>
    <!-- Hero Section End -->
    
        <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                	<% 
		                       if(categos != null){	
			
		                    	   for(int i = 0 ; i < categos.size() ; i++){
										categorie c = new categorie();
										c = categos.get(i);
											
					%>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="categories/cat<%=i %>.jpg">
                            <h5><a href="categorie.jsp?id=<%=c.getId() %>"><%=c.getName() %></a></h5>
                        </div>
                    </div>
                    <%}}else{ %>
									<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
					<%} %>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->
    
    
      <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                        <li class="active" data-filter="*">All</li>
                        <% 
		                       if(categos != null){	
			
		                    	   for(categorie c : categos){
													
						%>
                            
                            <li data-filter=".<%=c.getName() %>"><%=c.getName() %></li>
                        
                        <%}} %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            	<% 
		                       if(phones != null){	
			
									for(phone p : phones){
										
									categorie c1 = cdao.getcategorieById(p.getCategorie());
										
				%>
                <div style="margin-bottom:50px" class="col-lg-3 col-md-4 col-sm-6 mix <%=c1.getName() %>">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="phones/<%=p.getImage()%>">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><%=p.getName() %></a></h6>
                            <h5>$<%=p.getPrice() %></h5>
                        </div>
                    </div>
                </div>
                <%}}else{ %>
									<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
				<%} %>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->
    
    


<jsp:include page="footer.jsp"></jsp:include>    


