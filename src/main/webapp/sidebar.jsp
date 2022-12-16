                  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.phone"%>
  <%@page import="dao.phoneDAO"%>
  
<%

	HttpSession ss = request.getSession();
	
	categorieDAO cdao = new categorieDAO();
	
	ArrayList<categorie> categos = cdao.getcategories();
	
	phoneDAO pdao = new phoneDAO();
	
	ArrayList<phone> phones = pdao.getPhones();
	
%>
                
                
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
                             <ul>
		                       <% 
		                       if(categos != null){	
			
									for(categorie c : categos){
									
								%>
		                            <li><a href="categorie.jsp?id=<%=c.getId()%>"><%=c.getName()%></a></li>
		                            
		                        <%}}else{ %>
									<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
								<%} %>
                        </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
	                                    <% phones.sort(Comparator.comparing(o -> phones.get(0).getDate()));
		                                	for(phone p : phones){ 
		                              
					
	                                	%>
	                                        <a href="#" class="latest-product__item">
	                                            <div class="latest-product__item__pic">
	                                                <img src="phones/<%=p.getImage() %>" alt="">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                                <h6><%=p.getName() %></h6>
	                                                <span>$<%=p.getPrice() %></span>
	                                            </div>
	                                        </a>
	                                     <%} %>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                    </div>