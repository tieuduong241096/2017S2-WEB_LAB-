<%-- 
    Document   : slider
    Created on : Apr 16, 2017, 9:01:58 AM
    Author     : duongle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SLIDER</title>
    </head>
    <body>
        <section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>S</span>-LAB</h1>
									<h2>40 years in the making</h2>
                                                                        <p>Pro Leather Vintage</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
                                                                    <img src="resources/images/home/adi.jpg" class="girl img-responsive" alt="" />
                                                                   
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>S</span>-LAB</h1>
									<h2>Are we running today?</h2>
									<p>Prices are marked</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
                                                                    <img src="resources/images/home/nike.jpg" class="girl img-responsive" alt="" />
                                                                    
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>S</span>-LAB</h1>
									<h2>Any Field. Every time</h2>
									<p>The quest for diamonds continues</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
                                                                    <img src="resources/images/home/cons1.png" class="girl img-responsive" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
    </body>
</html>
