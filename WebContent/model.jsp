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
					<label>选择训练数据集</label> &nbsp;&nbsp;<input type="file"
						class="form-control" id="train">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<label>选择测试数据集</label> &nbsp;&nbsp;<input type="file"
						class="form-control" id="test">
				</div>
			</form>
			<br>
			<form class="form-inline">
				<div class="form-group">
					<label>选择算法</label> &nbsp;&nbsp; <select id="algo"
						class="form-control">
						<option value="fm">Factorization Machine</option>
						<option value="lr">Logistic Regression</option>
						<option value="gbdt">Gradient Boosting Decision Tree</option>
						<option value="rf">Random Forest</option>
					</select>
				</div>
				&nbsp;&nbsp;
				<button id="submitTask" type="button" class="btn btn-default">提交任务</button>
			</form>

		</div>
		<br>
		<div>
			<h4>训练状态</h4>
			<hr>
			<div id="trainProcess" class="jumbotron" style="height: 300px"></div>
		</div>
		<div>
			<h4>
				训练结果&nbsp;&nbsp;&nbsp;
				<button id="plot" class="btn btn-default" style="display: none">绘制对比图</button>
			</h4>
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
						<td><span id="fm_time" style="display: none">249.32</span></td>
						<td><span id="lr_time" style="display: none">23.448</span></td>
						<td><span id="gbdt_time" style="display: none">432.76</span></td>
						<td><span id="rf_time" style="display: none">476.67</span></td>
					</tr>
					<tr align="center">
						<td>Log Loss</td>
						<td><span id="fm_log" style="display: none">0.6048</span></td>
						<td><span id="lr_log" style="display: none">0.6110</span></td>
						<td><span id="gbdt_log" style="display: none">0.6212</span></td>
						<td><span id="rf_log" style="display: none">0.6154</span></td>
					</tr>
					<tr align="center">
						<td>Accuracy</td>
						<td><span id="fm_acc" style="display: none">0.6712</span></td>
						<td><span id="lr_acc" style="display: none">0.6637</span></td>
						<td><span id="gbdt_acc" style="display: none">0.6559</span></td>
						<td><span id="rf_acc" style="display: none">0.6661</span></td>
					</tr>
					<tr align="center">
						<td>Precision</td>
						<td><span id="fm_pre" style="display: none">0.6623</span></td>
						<td><span id="lr_pre" style="display: none">0.6535</span></td>
						<td><span id="gbdt_pre" style="display: none">0.6742</span></td>
						<td><span id="rf_pre" style="display: none">0.6775</span></td>
					</tr>
					<tr align="center">
						<td>Recall</td>
						<td><span id="fm_rec" style="display: none">0.7219</span></td>
						<td><span id="lr_rec" style="display: none">0.7217</span></td>
						<td><span id="gbdt_rec" style="display: none">0.5926</span></td>
						<td><span id="rf_rec" style="display: none">0.6237</span></td>
					</tr>
					<tr align="center">
						<td>AUC</td>
						<td><span id="fm_auc" style="display: none">0.7314</span></td>
						<td><span id="lr_auc" style="display: none">0.7222</span></td>
						<td><span id="gbdt_auc" style="display: none">0.7127</span></td>
						<td><span id="rf_auc" style="display: none">0.7259</span></td>
					</tr>
					<tr align="center">
						<td>ROC</td>
						<td><img id="fm_roc" style="display: none" width="200"
							height="138" alt="" src="img/fm_roc.png"></td>
						<td><img id="lr_roc" style="display: none" width="200"
							height="138" alt="" src="img/lr_roc.png"></td>
						<td><img id="gbdt_roc" style="display: none" width="200"
							height="138" alt="" src="img/gbdt_roc.png"></td>
						<td><img id="rf_roc" style="display: none" width="200"
							height="138" alt="" src="img/rf_roc.png"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row" align="center">
			<div id="timebar" class="col-md-6"
				style="width: 500px; height: 400px; display: none"></div>
			<div id="logbar" class="col-md-6"
				style="width: 500px; height: 400px; display: none"></div>
		</div>
		<div class="row" align="center">
			<div id="accbar" class="col-md-6"
				style="width: 500px; height: 400px; display: none"></div>
			<div id="prebar" class="col-md-6"
				style="width: 500px; height: 400px; display: none"></div>
		</div>
		<div class="row" align="center">
			<div id="recbar" class="col-md-6"
				style="width: 500px; height: 400px; display: none"></div>
			<div id="aucbar" class="col-md-6"
				style="width: 500px; height: 400px; display: none"></div>
		</div>
	</div>
	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/echarts.common.min.js"></script>
	<script>
		var jq = $.noConflict();
		function showFM() {
			jq("#fm_time").show();
			jq("#fm_log").show();
			jq("#fm_acc").show();
			jq("#fm_pre").show();
			jq("#fm_rec").show();
			jq("#fm_auc").show();
			jq("#fm_roc").show();
		}
		function showLR() {
			jq("#lr_time").show();
			jq("#lr_log").show();
			jq("#lr_acc").show();
			jq("#lr_pre").show();
			jq("#lr_rec").show();
			jq("#lr_auc").show();
			jq("#lr_roc").show();
		}
		function showGBDT() {
			jq("#gbdt_time").show();
			jq("#gbdt_log").show();
			jq("#gbdt_acc").show();
			jq("#gbdt_pre").show();
			jq("#gbdt_rec").show();
			jq("#gbdt_auc").show();
			jq("#gbdt_roc").show();
		}
		function showRF() {
			jq("#rf_time").show();
			jq("#rf_log").show();
			jq("#rf_acc").show();
			jq("#rf_pre").show();
			jq("#rf_rec").show();
			jq("#rf_auc").show();
			jq("#rf_roc").show();
		}
		jq(document).ready(
				function() {
					// submit task
					jq("#submitTask").click(function() {
						jq.post("SubmitServlet", {
							algo : jq("#algo").val()
						}, function(data, status) {
							jq("#trainProcess").text(data);
						});
					});

					// plot
					jq("#plot").show();
					jq("#plot").click(
							function() {
								showFM();
								showLR();
								showGBDT();
								showRF();
								jq("#timebar").show();
								jq("#logbar").show();
								jq("#accbar").show();
								jq("#prebar").show();
								jq("#recbar").show();
								jq("#aucbar").show();
								// timebar
								var timechart = echarts.init(document
										.getElementById('timebar'));
								var option = {
									title : {
										text : 'Training Time'
									},
									yAxis : {},
									xAxis : {
										data : [ "FM", "LR", "GBDT", "RF" ]
									},
									color : [ '#61a0a8' ],
									series : [ {
										name : "time",
										type : 'bar',
										data : [ jq("#fm_time").text(),
												jq("#lr_time").text(),
												jq("#gbdt_time").text(),
												jq("#rf_time").text() ]
									} ]
								};
								timechart.setOption(option);
								// logbar
								var logchart = echarts.init(document
										.getElementById('logbar'));
								var option = {
									title : {
										text : 'Log Loss'
									},
									yAxis : {
										min : 0.6,
										max : 0.63
									},
									xAxis : {
										data : [ "FM", "LR", "GBDT", "RF" ]
									},
									color : [ '#61a0a8' ],
									series : [ {
										type : 'bar',
										data : [ jq("#fm_log").text(),
												jq("#lr_log").text(),
												jq("#gbdt_log").text(),
												jq("#rf_log").text() ]
									} ]
								};
								logchart.setOption(option);
								// accbar
								var accchart = echarts.init(document
										.getElementById('accbar'));
								var option = {
									title : {
										text : 'Accuracy'
									},
									yAxis : {
										min : 0.65,
										max : 0.68
									},
									xAxis : {
										data : [ "FM", "LR", "GBDT", "RF" ]
									},
									color : [ '#61a0a8' ],
									series : [ {
										type : 'bar',
										data : [ jq("#fm_acc").text(),
												jq("#lr_acc").text(),
												jq("#gbdt_acc").text(),
												jq("#rf_acc").text() ]
									} ]
								};
								accchart.setOption(option);
								// prebar
								var prechart = echarts.init(document
										.getElementById('prebar'));
								var option = {
									title : {
										text : 'Precision'
									},
									yAxis : {
										min : 0.65,
										max : 0.68
									},
									xAxis : {
										data : [ "FM", "LR", "GBDT", "RF" ]
									},
									color : [ '#61a0a8' ],
									series : [ {
										type : 'bar',
										data : [ jq("#fm_pre").text(),
												jq("#lr_pre").text(),
												jq("#gbdt_pre").text(),
												jq("#rf_pre").text() ]
									} ]
								};
								prechart.setOption(option);
								// recbar
								var recchart = echarts.init(document
										.getElementById('recbar'));
								var option = {
									title : {
										text : 'Recall'
									},
									yAxis : {
										min : 0.55,
										max : 0.75
									},
									xAxis : {
										data : [ "FM", "LR", "GBDT", "RF" ]
									},
									color : [ '#61a0a8' ],
									series : [ {
										type : 'bar',
										data : [ jq("#fm_rec").text(),
												jq("#lr_rec").text(),
												jq("#gbdt_rec").text(),
												jq("#rf_rec").text() ]
									} ]
								};
								recchart.setOption(option);
								// aucbar
								var aucchart = echarts.init(document
										.getElementById('aucbar'));
								var option = {
									title : {
										text : 'AUC'
									},
									yAxis : {
										min : 0.71,
										max : 0.74
									},
									xAxis : {
										data : [ "FM", "LR", "GBDT", "RF" ]
									},
									color : [ '#61a0a8' ],
									series : [ {
										type : 'bar',
										data : [ jq("#fm_auc").text(),
												jq("#lr_auc").text(),
												jq("#gbdt_auc").text(),
												jq("#rf_auc").text() ]
									} ]
								};
								aucchart.setOption(option);
							});

				});
	</script>
</body>
</html>