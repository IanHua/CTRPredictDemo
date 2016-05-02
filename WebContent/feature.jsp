<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CTR Prediction Demo System</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sui.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h3>《基于Apache Spark的CTR预估算法研究》演示系统</h3>
		<hr>
		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="index.jsp">Overview</a></li>
			<li role="presentation" class="active"><a href="#">Feature
					Engineering</a></li>
			<li role="presentation"><a href="model.jsp">Model Training</a></li>
		</ul>
		<div class="sui-steps steps-auto">
			<div class="wrap">
				<div class="finished">
					<label><span class="round">1</span><span>原始数据</span></label><i
						class="triangle-right-bg"></i><i class="triangle-right"></i>
				</div>
			</div>
			<div class="wrap">
				<div class="current">
					<label><span class="round">2</span><span>增加特征</span></label><i
						class="triangle-right-bg"></i><i class="triangle-right"></i>
				</div>
			</div>
			<div class="wrap">
				<div class="todo">
					<label><span class="round">3</span><span>Min-Max标准化</span></label>
				</div>
			</div>
			<div class="wrap">
				<div class="todo">
					<label><span class="round">4</span><span>特征哈希</span></label>
				</div>
			</div>
			<div class="wrap">
				<div class="todo">
					<label><span class="round">5</span><span>LIBSVM格式转换</span></label>
				</div>
			</div>
		</div>


		<p>原始数据样例 共23个特征</p>
		<br>
		<div align="center">data</div>




		<br>
		<div align="center">
			<button type="button" class="btn btn-default btn-lg">
				<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
				Transform
			</button>
		</div>

	</div>

	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/sui.min.js"></script>
</body>
</html>