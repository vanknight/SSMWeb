<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/4/19 13:39
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>Search result | </title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content=" description" name="description">
    <meta content=" keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <link rel="shortcut icon" href="favicon.ico">

</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
<jsp:include page="shop-header.jsp"/>

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Store</a></li>
            <li class="active">Search result</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-5">
                <div class="sidebar-filter margin-bottom-25">
                    <h2>Search categories</h2>
                    <h3>Availability</h3>
                    <div class="checkbox-list">
                        <label><input type="checkbox"> Not Available (3)</label>
                        <label><input type="checkbox"> In Stock (26)</label>
                    </div>

                    <h3>Price</h3>
                    <p>
                        <label for="amount">Range:</label>
                        <input type="text" id="amount"
                               style="border:0; color:#f6931f; font-weight:bold;">
                    </p>
                    <div id="slider-range"></div>
                </div>

                <div class="sidebar-products clearfix">
                    <h2>Bestsellers</h2>
                    <div class="item">
                        <a href="shop-item.html"><img
                                src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/k1.jpg"
                                alt="Some Shoes in Animal with Cut Out"></a>
                        <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                        <div class="price">$31.00</div>
                    </div>
                    <div class="item">
                        <a href="shop-item.html"><img
                                src="${pageContext.request.contextPath}/v2/assets/pages/img/products/k4.jpg"
                                alt="Some Shoes in Animal with Cut Out"></a>
                        <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                        <div class="price">$23.00</div>
                    </div>
                    <div class="item">
                        <a href="shop-item.html"><img
                                src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/k3.jpg"
                                alt="Some Shoes in Animal with Cut Out"></a>
                        <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                        <div class="price">$86.00</div>
                    </div>
                </div>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <div class="content-search margin-bottom-20">
                    <div class="row">
                        <div class="col-md-6">
                            <h1>Search result for <em>shoes</em></h1>
                        </div>
                        <div class="col-md-6">
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" placeholder="Search again"
                                           class="form-control">
                                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">Search</button>
                      </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row list-view-sorting clearfix">
                    <div class="col-md-2 col-sm-2 list-view">
                        <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                        <a href="javascript:;"><i class="fa fa-th-list"></i></a>
                    </div>
                    <div class="col-md-10 col-sm-10">
                        <div class="pull-right">
                            <label class="control-label">Show:</label>
                            <select class="form-control input-sm">
                                <option value="#?limit=24" selected="selected">24</option>
                                <option value="#?limit=25">25</option>
                                <option value="#?limit=50">50</option>
                                <option value="#?limit=75">75</option>
                                <option value="#?limit=100">100</option>
                            </select>
                        </div>
                        <div class="pull-right">
                            <label class="control-label">Sort&nbsp;By:</label>
                            <select class="form-control input-sm">
                                <option value="#?sort=p.sort_order&amp;order=ASC"
                                        selected="selected">Default
                                </option>
                                <option value="#?sort=pd.name&amp;order=ASC">Name (A - Z)</option>
                                <option value="#?sort=pd.name&amp;order=DESC">Name (Z - A)</option>
                                <option value="#?sort=p.price&amp;order=ASC">Price (Low &gt; High)
                                </option>
                                <option value="#?sort=p.price&amp;order=DESC">Price (High &gt;
                                    Low)
                                </option>
                                <option value="#?sort=rating&amp;order=DESC">Rating (Highest)
                                </option>
                                <option value="#?sort=rating&amp;order=ASC">Rating (Lowest)</option>
                                <option value="#?sort=p.model&amp;order=ASC">Model (A - Z)</option>
                                <option value="#?sort=p.model&amp;order=DESC">Model (Z - A)</option>
                            </select>
                        </div>
                    </div>
                </div>
                <!-- BEGIN PRODUCT LIST -->
                <div class="row product-list">
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model1.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model1.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model2.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model2.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model6.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model6.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress 2</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                </div>
                <div class="row product-list">
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model4.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model4.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model5.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model5.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            <div class="sticker sticker-new"></div>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model3.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model3.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                </div>
                <div class="row product-list">
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model7.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model7.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model1.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model1.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                    <!-- PRODUCT ITEM START -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model2.jpg"
                                     class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model2.jpg"
                                       class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up"
                                       class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            <div class="sticker sticker-sale"></div>
                        </div>
                    </div>
                    <!-- PRODUCT ITEM END -->
                </div>
                <!-- END PRODUCT LIST -->
                <!-- BEGIN PAGINATOR -->
                <div class="row">
                    <div class="col-md-4 col-sm-4 items-info">Items 1 to 9 of 10 total</div>
                    <div class="col-md-8 col-sm-8">
                        <ul class="pagination pull-right">
                            <li><a href="javascript:;">&laquo;</a></li>
                            <li><a href="javascript:;">1</a></li>
                            <li><span>2</span></li>
                            <li><a href="javascript:;">3</a></li>
                            <li><a href="javascript:;">4</a></li>
                            <li><a href="javascript:;">5</a></li>
                            <li><a href="javascript:;">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
                <!-- END PAGINATOR -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>
<jsp:include page="shop-bottom.jsp"/>

<!-- BEGIN fast view of a product -->
<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-3">
                <div class="product-alipayServiceImpl-image">
                    <img src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model7.jpg"
                         alt="Cool green dress with red bell" class="img-responsive">
                </div>
                <div class="product-other-images">
                    <a href="javascript:;" class="active"><img alt="Berry Lace Dress"
                                                               src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model3.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress"
                                                src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model4.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress"
                                                src="${pageContext.request.contextPath}/v2/assets/pages/img/products/clothes/model5.jpg"></a>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-9">
                <h1>Cool green dress with red bell</h1>
                <div class="price-availability-block clearfix">
                    <div class="price">
                        <strong><span>$</span>47.00</strong>
                        <em>$<span>62.00</span></em>
                    </div>
                    <div class="availability">
                        Availability: <strong>In Stock</strong>
                    </div>
                </div>
                <div class="description">
                    <p>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed
                        euismod laoreet dolore magna aliquarm erat volutpat
                        Nostrud duis molestie at dolore.</p>
                </div>
                <div class="product-page-options">
                    <div class="pull-left">
                        <label class="control-label">Size:</label>
                        <select class="form-control input-sm">
                            <option>L</option>
                            <option>M</option>
                            <option>XL</option>
                        </select>
                    </div>
                    <div class="pull-left">
                        <label class="control-label">Color:</label>
                        <select class="form-control input-sm">
                            <option>Red</option>
                            <option>Blue</option>
                            <option>Black</option>
                        </select>
                    </div>
                </div>
                <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly
                               name="product-quantity" class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" type="submit">Add to cart</button>
                    <a href="shop-item.html" class="btn btn-default">More details</a>
                </div>
            </div>

            <div class="sticker sticker-sale"></div>
        </div>
    </div>
</div>
<!-- END fast view of a product -->

<script type="text/javascript">
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Layout.initSliderRange();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>