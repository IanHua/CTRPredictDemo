<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CTR Prediction Demo System</title>
<link href="css/sui.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
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
				<div id="step1" class="current">
					<label><span class="round">1</span><span>原始数据</span></label><i
						class="triangle-right-bg"></i><i class="triangle-right"></i>
				</div>
			</div>
			<div class="wrap">
				<div id="step2" class="todo">
					<label><span class="round">2</span><span>增加特征</span></label><i
						class="triangle-right-bg"></i><i class="triangle-right"></i>
				</div>
			</div>
			<div class="wrap">
				<div id="step3" class="todo">
					<label><span class="round">3</span><span>Min-Max标准化</span></label><i
						class="triangle-right-bg"></i><i class="triangle-right"></i>
				</div>
			</div>
			<div class="wrap">
				<div id="step4" class="todo">
					<label><span class="round">4</span><span>特征哈希</span></label><i
						class="triangle-right-bg"></i><i class="triangle-right"></i>
				</div>
			</div>
			<div class="wrap">
				<div id="step5" class="todo">
					<label><span class="round">5</span><span>LIBSVM格式转换</span></label>
				</div>
			</div>
		</div>

		<div id="step1_text">
			<p>数据来源: Kaggle Click-Through Rate Prediction Contest</p>
			<p>数据大小: train(1.04 GB, 40,428,967条记录); test(118.07 MB,
				4,577,464条记录)</p>
			<p>特征数量: 共23个特征, 其中21个是类别型特征, 9个匿名特征</p>
			<p>类标号Click: 1表示点击, 0表示未点击</p>
		</div>

		<div id="step1_data" align="center" style="overflow:auto; overflow-style:scrollbar">
			<table class="table table-striped">
				<thead>
					<tr align="center">
						<td>id</td>
						<td>click</td>
						<td>hour</td>
						<td>C1</td>
						<td>banner_pos</td>
						<td>site_id</td>
						<td>site_domain</td>
						<td>site_category</td>
						<td>app_id</td>
						<td>app_domain</td>
						<td>app_category</td>
						<td>device_id</td>
						<td>device_ip</td>
						<td>device_model</td>
						<td>device_type</td>
						<td>device_conn_type</td>
						<td>C14</td>
						<td>C15</td>
						<td>C16</td>
						<td>C17</td>
						<td>C18</td>
						<td>C19</td>
						<td>C20</td>
						<td>C21</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>10009699694430474960</td>
						<td>1</td>
						<td>14102100</td>
						<td>1005</td>
						<td>0</td>
						<td>4dd0a958</td>
						<td>79cf0c8d</td>
						<td>f028772b</td>
						<td>ecad2386</td>
						<td>7801e8d9</td>
						<td>07d7df22</td>
						<td>a99f214a</td>
						<td>f6a5ae09</td>
						<td>88fe1d5d</td>
						<td>1</td>
						<td>0</td>
						<td>20366</td>
						<td>320</td>
						<td>50</td>
						<td>2333</td>
						<td>0</td>
						<td>39</td>
						<td>-1</td>
						<td>157</td>
					</tr>
				</tbody>
			</table>
		</div>




		<br>
		<div align="center">
			<button id="next" type="button" class="btn btn-default btn-lg">
				<span class="glyphicon glyphicon-menu-right"></span><br>下一步
			</button>
		</div>

	</div>

	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/sui.min.js"></script>
	<script>
		var jq = $.noConflict();
		function changeStep() {
			if (jq("#step2").attr("class") == "todo"
					&& jq("#step1").attr("class") == "current") {
				// add feature
				jq("#step1").attr("class", "finished");
				jq("#step2").attr("class", "current");
			} else if (jq("#step3").attr("class") == "todo"
					&& jq("#step2").attr("class") == "current") {
				// min-max
				jq("#step2").attr("class", "finished");
				jq("#step3").attr("class", "current");
			} else if (jq("#step4").attr("class") == "todo"
					&& jq("#step3").attr("class") == "current") {
				// feature hashing
				jq("#step3").attr("class", "finished");
				jq("#step4").attr("class", "current");
			} else if (jq("#step5").attr("class") == "todo"
					&& jq("#step4").attr("class") == "current") {
				// libsvm
				jq("#step4").attr("class", "finished");
				jq("#step5").attr("class", "current");
			}
		}
		jq(document).ready(function() {
			jq("#next").click(changeStep);
		});
	</script>
</body>
</html>