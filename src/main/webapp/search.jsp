

<jsp:include page="header.jsp"></jsp:include>    


  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.phone"%>
  <%@page import="dao.phoneDAO"%>
  
<%

	String str = "";

	if(request.getParameter("str")!=null){
		str = request.getParameter("str");
	}else{
		response.sendRedirect("shop.jsp");
	}
	HttpSession ss = request.getSession();
	
	categorieDAO cdao = new categorieDAO();
	
	ArrayList<categorie> categos = cdao.getcategories();
	
	phoneDAO pdao = new phoneDAO();
	
	ArrayList<phone> phones = pdao.searchPhones(str);
	
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
                        <h2>OGANI SHOP</h2>
                        <div class="breadcrumb__option">
                            <a href="index.jsp">Home</a>
                            <span><%=str %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                
					<jsp:include page="sidebar.jsp"></jsp:include>    
				
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                       
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span><%=phones.size() %></span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<% 
		                       if(phones != null){	
			
									for(phone p : phones){
										
												
						%>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="phones/<%=p.getImage()%>">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="phone.jsp?id=<%=p.getId() %>"><i class="fa fa-eye"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="phone.jsp?id=<%=p.getId()%>"><%=p.getName()%></a></h6>
                                    <h5>$<%=p.getPrice()%></h5>
                                </div>
                            </div>
                        </div>
						<%}}else{ %>
									<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
						<%} %>
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->


<jsp:include page="footer.jsp"></jsp:include>    
