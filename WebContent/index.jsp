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
</head>
<body>
	<div class="container">
		<h3>《基于Apache Spark的CTR预估算法研究》模型训练系统</h3>
		<hr>
		<ul class="nav nav-pills nav-justified">
			<li role="presentation" class="active"><a href="#">Overview</a></li>
			<li role="presentation"><a href="feature.jsp">Feature
					Engineering</a></li>
			<li role="presentation"><a href="model.jsp">Model Training</a></li>
		</ul>
		<br> <br>
		<div class="row">
			<div class="col-md-6">
				<h3 align="center" style="color: #0066FF">CTR预估</h3>
				<br>
				<p class="leading" style="font-size: 15px">广告CTR（Click-Through
					Rate，点击率）预估，即通过机器学习等方式对用户点击广告的概率进行预测，以进行广告与用户的最佳匹配，实现广告主、广告联盟、企业与用户的四方共赢。
				</p>
			</div>
			<div class="col-md-6">
				<h3 align="center" style="color: #0066FF">Apache Spark</h3>
				<br>
				<p class="leading" style="font-size: 15px">Apache Spark是UC
					Berkeley开发的并行计算框架，但与Hadoop
					MapReduce不同的是，Spark使用弹性分布式数据集(RDD)将数据保存在内存中，而不需要再去读写HDFS，节省了硬盘传输的开销。因此，Spark更适用于需要不断迭代的机器学习算法，速度可以达到Hadoop的100倍。
				</p>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-6">
				<h3 align="center" style="color: #0066FF">使用算法</h3>
				<br>
				<ul style="font-size: 15px">
					<li>Factorization Machine(因式分解机): 加入关联特征项，更适合CTR预估场景</li>

					<li>Logistic Regression(逻辑斯特回归): 经典的线性模型</li>

					<li>Gradient Boosting Decision Tree(梯度提升树): 以Boosting提升的多棵决策树</li>

					<li>Random Forest(随机森林): 以Averaging组合的多棵决策树</li>
				</ul>
			</div>
			<div class="col-md-6">
				<h3 align="center" style="color: #0066FF">研究工作</h3>
				<br>
				<ul style="font-size: 15px">
					<li>特征工程与数据预处理</li>

					<li>基于Apache Spark并行化设计以上四种算法(主要是Factorization Machine)</li>

					<li>模型训练</li>

					<li>CTR预估效果评估</li>
				</ul>
			</div>
		</div>
	</div>



	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>