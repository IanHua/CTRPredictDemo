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
		<h3>《基于Apache Spark的CTR预估算法研究》演示系统</h3>
		<hr>
		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="index.jsp">Overview</a></li>
			<li role="presentation"><a href="feature.jsp">Feature
					Engineering</a></li>
			<li role="presentation" class="active"><a href="#">Model
					Training</a></li>
		</ul>
		<br>
		<div>
			<form class="form-inline">
				<div class="form-group">
					<label id="data">选择数据文件</label> &nbsp;&nbsp;<input type="file"
						class="form-control" id="file" name="选择文件">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<label id="algo">选择算法</label> &nbsp;&nbsp; <select
						class="form-control">
						<option>Factorization Machine</option>
						<option>Logistic Regression</option>
						<option>Gradient Boosting Decision Tree</option>
						<option>Random Forest</option>
					</select>
				</div>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-default">提交任务</button>


		  </form>
		</div>
		<br>
		<div>
			<h4>训练状态</h4>
			<hr>
			<div class="jumbotron">Training...</div>
		</div>
		<div>
			<h4>训练结果</h4>
			<hr>
			<table class="table table-striped">
				<thead>
					<tr align="center">
						<td>Algorithm</td>
						<td>Factorization Machine</td>
						<td>Logistic Regression</td>
						<td>Gradient Boosting Decision Tree</td>
						<td>Random Forest</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>Training Time(s)</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

					<tr align="center">
						<td>Log Loss</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

					<tr align="center">
						<td>True Positive</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr align="center">
						<td>False Negative</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr align="center">
						<td>False Positive</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr align="center">
						<td>True Negative</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

					<tr align="center">
						<td>Accuracy</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr align="center">
						<td>Precision</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr align="center">
						<td>Recall</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr align="center">
						<td>AUC</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr align="center">
						<td>ROC</td>
						<td><img width="200" height="138" alt="" src="img/fm_roc.png"></td>
						<td><img width="200" height="138" alt="" src="img/lr_roc.png"></td>
						<td><img width="200" height="138" alt="" src="img/gbdt_roc.png"></td>
						<td><img width="200" height="138" alt="" src="img/rf_roc.png"></td>
					</tr>

				</tbody>
			</table>
		</div>


	</div>
	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>