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
		<h3>《基于Apache Spark的CTR预估算法研究》模型训练系统</h3>
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
			<p>原数据大小: train(1.04 GB, 40,428,967条记录); test(118.07 MB,
				4,577,464条记录); 随机采样106MB(679,506条记录)用于单机实验</p>
			<p>特征数量: 共23个特征, 其中21个是类别型特征, 9个匿名特征</p>
			<p>类标号Click: 1表示点击, 0表示未点击</p>
		</div>

		<div id="step1_data" align="center"
			style="overflow: auto; overflow-style: scrollbar">
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
					<tr align="center">
						<td>10018076683759767024</td>
						<td>1</td>
						<td>14102100</td>
						<td>1002</td>
						<td>0</td>
						<td>84c7ba46</td>
						<td>c4e18dd6</td>
						<td>50e219e0</td>
						<td>ecad2386</td>
						<td>7801e8d9</td>
						<td>07d7df22</td>
						<td>e62f1261</td>
						<td>7b485f88</td>
						<td>cf19f7f7</td>
						<td>0</td>
						<td>0</td>
						<td>21300</td>
						<td>320</td>
						<td>50</td>
						<td>2446</td>
						<td>3</td>
						<td>171</td>
						<td>100228</td>
						<td>156</td>
					</tr>
					<tr align="center">
						<td>10028661841911511440</td>
						<td>1</td>
						<td>14102100</td>
						<td>1005</td>
						<td>0</td>
						<td>5b08c53b</td>
						<td>7687a86e</td>
						<td>3e814130</td>
						<td>ecad2386</td>
						<td>7801e8d9</td>
						<td>07d7df22</td>
						<td>a99f214a</td>
						<td>fe630f98</td>
						<td>3db9fde9</td>
						<td>1</td>
						<td>0</td>
						<td>19016</td>
						<td>300</td>
						<td>250</td>
						<td>2162</td>
						<td>2</td>
						<td>39</td>
						<td>-1</td>
						<td>33</td>
					</tr>
					<tr align="center">
						<td>10033581569437701421</td>
						<td>1</td>
						<td>14102100</td>
						<td>1005</td>
						<td>0</td>
						<td>1fbe01fe</td>
						<td>f3845767</td>
						<td>28905ebd</td>
						<td>ecad2386</td>
						<td>7801e8d9</td>
						<td>07d7df22</td>
						<td>a99f214a</td>
						<td>0489ce3f</td>
						<td>553f099b</td>
						<td>1</td>
						<td>0</td>
						<td>15703</td>
						<td>320</td>
						<td>50</td>
						<td>1722</td>
						<td>0</td>
						<td>35</td>
						<td>-1</td>
						<td>79</td>
					</tr>
					<tr align="center">
						<td>10058616822894840352</td>
						<td>0</td>
						<td>14102100</td>
						<td>1005</td>
						<td>0</td>
						<td>1fbe01fe</td>
						<td>f3845767</td>
						<td>28905ebd</td>
						<td>ecad2386</td>
						<td>7801e8d9</td>
						<td>07d7df22</td>
						<td>a99f214a</td>
						<td>0f65bd29</td>
						<td>49ea3580</td>
						<td>1</td>
						<td>0</td>
						<td>15704</td>
						<td>320</td>
						<td>50</td>
						<td>1722</td>
						<td>0</td>
						<td>35</td>
						<td>100084</td>
						<td>79</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="step2_text" style="display: none">
			<p>根据原始数据对每条记录新增8维特征</p>
			<ul>
				<li>i_ad_hour: 一小时中该用户点击该广告的次数</li>
				<li>i_group_hour: 一小时中该用户点击该广告组的次数</li>
				<li>i_ad_day: 一天中该用户点击该广告的次数</li>
				<li>i_group_day: 一天中该用户点击该广告组的次数</li>
				<li>i_user_day: 一天中该用户点击的总次数</li>
				<li>i_site_app: 一天中该用户点击该App或网站的次数</li>
				<li>time_interval: 该用户自上次点击以来的时间间隔</li>
				<li>uid_day: 该用户一共登录的天数</li>
			</ul>
		</div>

		<div id="step2_data" align="center"
			style="overflow: auto; overflow-style: scrollbar; display: none">
			<table class="table table-striped">
				<thead>
					<tr align="center">
						<td>id</td>
						<td>i_ad_hour</td>
						<td>i_group_hour</td>
						<td>i_ad_day</td>
						<td>i_group_day</td>
						<td>i_user_day</td>
						<td>i_site_app</td>
						<td>time_interval</td>
						<td>uid_day</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>10009699694430474960</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>1</td>
					</tr>
					<tr align="center">
						<td>10018076683759767024</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>1</td>
					</tr>
					<tr align="center">
						<td>10028661841911511440</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>1</td>
					</tr>
					<tr align="center">
						<td>10033581569437701421</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>2</td>
					</tr>
					<tr align="center">
						<td>10058616822894840352</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="step3_text" style="display: none">
			<p>由于新增特征之间的数量级相差较大，对模型训练的收敛速度会产生一定影响，需要使用Min-Max标准化来处理数据</p>
			<p>另外，在标准化处理之前还需要去除少量离群点</p>
			<img src="img/minmax.jpg" width="150" height="60" />
		</div>

		<div id="step3_data" align="center"
			style="overflow: auto; overflow-style: scrollbar; display: none">
			<h4>标准化前的数据分布统计</h4>
			<table class="table table-striped">
				<thead>
					<tr align="center">
						<td>feature</td>
						<td>i_ad_hour</td>
						<td>i_group_hour</td>
						<td>i_ad_day</td>
						<td>i_group_day</td>
						<td>i_user_day</td>
						<td>i_site_app</td>
						<td>time_interval</td>
						<td>uid_day</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>平均值</td>
						<td>1.072</td>
						<td>1.131</td>
						<td>1.420</td>
						<td>1.687</td>
						<td>1.940</td>
						<td>1.743</td>
						<td>-0.6651</td>
						<td>1.634</td>
					</tr>
					<tr align="center">
						<td>标准差</td>
						<td>0.7698</td>
						<td>1.302</td>
						<td>6.595</td>
						<td>8.111</td>
						<td>9.520</td>
						<td>9.094</td>
						<td>1.437</td>
						<td>1.925</td>
					</tr>
					<tr align="center">
						<td>最小值</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>1</td>
					</tr>
					<tr align="center">
						<td>25百分位数</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>1</td>
					</tr>
					<tr align="center">
						<td>50百分位数</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>-1</td>
						<td>1</td>
					</tr>
					<tr align="center">
						<td>90百分位数</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>2</td>
						<td>1</td>
						<td>0</td>
						<td>3</td>
					</tr>
					<tr align="center">
						<td>99百分位数</td>
						<td>2</td>
						<td>3</td>
						<td>6</td>
						<td>12</td>
						<td>18</td>
						<td>12</td>
						<td>7</td>
						<td>10</td>
					</tr>
					<tr align="center">
						<td>最大值</td>
						<td>44</td>
						<td>101</td>
						<td>389</td>
						<td>389</td>
						<td>389</td>
						<td>389</td>
						<td>23</td>
						<td>10</td>
					</tr>
				</tbody>
			</table>

			<h4>标准化后的数据分布统计</h4>
			<table class="table table-striped">
				<thead>
					<tr align="center">
						<td>feature</td>
						<td>i_ad_hour</td>
						<td>i_group_hour</td>
						<td>i_ad_day</td>
						<td>i_group_day</td>
						<td>i_user_day</td>
						<td>i_site_app</td>
						<td>time_interval</td>
						<td>uid_day</td>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>平均值</td>
						<td>0.01866</td>
						<td>0.01989</td>
						<td>0.01271</td>
						<td>0.01303</td>
						<td>0.01345</td>
						<td>0.01351</td>
						<td>-0.9094</td>
						<td>0.06276</td>
					</tr>
					<tr align="center">
						<td>标准差</td>
						<td>0.1353</td>
						<td>0.1059</td>
						<td>0.06935</td>
						<td>0.06035</td>
						<td>0.06012</td>
						<td>0.06420</td>
						<td>0.2760</td>
						<td>0.1989</td>
					</tr>
					<tr align="center">
						<td>最小值</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr align="center">
						<td>25百分位数</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr align="center">
						<td>50百分位数</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
					</tr>
					<tr align="center">
						<td>90百分位数</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>1</td>
						<td>0.1111</td>
					</tr>
					<tr align="center">
						<td>99百分位数</td>
						<td>1</td>
						<td>0.5</td>
						<td>0.4</td>
						<td>0.2727</td>
						<td>0.2941</td>
						<td>0.2727</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr align="center">
						<td>最大值</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="step4_text" style="display: none">
			<h4>处理类别型特征的几个例子，假设site_id的值属于集合{a,b,c,d}</h4>
			<h4>方法一: 映射</h4>
			<p>将{a,b,c,d}直接映射为{0,1,2,3}，但是会潜在地引入本来不存在的等级差</p>
			<h4>方法二: One-hot Encoding</h4>
			<p>a->[1 0 0 0]; b->[0 1 0 0]; c->[0 0 1 0]; d->[0 0 0 1]</p>
			<p>需要准备查询数组，转化后数据将会非常稀疏，对存储空间要求很大</p>
			<h4>方法三: 特征哈希(Feature Hashing)</h4>
			<p>
				将<strong>hash(a) mod N</strong>直接作为每条记录的序号index，大大节省了存储开销
			</p>
		</div>

		<div id="step4_data" style="display: none">
			<h4>特征哈希的伪代码</h4>
			<pre>function feature_hashing(features : array of string, N : integer):
     x := new vector[N]
     for f in features:
         h := hash(f)
         x[h mod N] += 1
     return x</pre>
		</div>

		<div id="step5_text" style="display: none">
			<p>Spark以LIBSVM的格式读取训练数据，并转化为RDD[LabeledPoint]</p>
			<p>在进行特征哈希时，直接将数据转化为LIBSVM格式</p>
			<pre>label index1:value1 index2:value2 ... indexN:valueN</pre>
		</div>

		<div id="step5_data"
			style="overflow: auto; overflow-style: scrollbar; display: none">
			<h4>最终的数据样例</h4>
			<pre>0 1:3 2:1 17:1 25:1 42:1 51:1 112:1 160:1 321:1 398:1 896:1 1006:1 2341:1 2392:1 6517:1 6988:1 7899:1 8167:1 8439:1 8519:1 9592:1 9925:1 10001:0.0 10002:0.0 10003:0.0 10004:0.0 10005:0.0 10006:0.0 10007:1.0 10008:0.0<br>0 1:2 2:2 12:1 29:1 49:1 51:1 78:1 321:1 593:1 936:1 1006:1 1502:1 1834:1 2228:1 3254:1 3685:1 6280:1 6988:1 8225:1 9289:1 9412:1 9772:1 10001:0.0 10002:0.0 10003:0.0 10004:0.0 10005:0.0 10006:0.0 10007:1.0 10008:0.0<br>0 1:2 2:2 18:1 24:1 51:1 52:1 222:1 321:1 548:1 1006:1 1502:1 1834:1 2142:1 2551:1 3254:1 3685:1 5776:1 6364:1 6988:1 8019:1 8421:1 9514:1 10001:1.0 10002:0.5 10003:0.2 10004:0.0909 10005:0.0588 10006:0.0909 10007:0.0 10008:0.0<br>1 1:1 2:2 4:1 14:1 24:1 26:1 51:1 78:1 176:1 321:1 755:1 762:1 1006:1 1834:1 3254:1 3685:1 3861:1 4564:1 5341:1 6988:1 8331:1 8570:1 9354:1 10001:0.0 10002:0.0 10003:0.0 10004:0.0 10005:0.0 10006:0.0 10007:1.0 10008:0.0<br>0 1:2 2:1 3:2 19:1 28:1 51:1 53:1 109:1 321:1 1006:1 1328:1 1834:1 2300:1 3254:1 3685:1 4188:1 5162:1 6024:1 6988:1 7056:1 8651:1 9538:1 10001:0.0 10002:0.0 10003:0.0 10004:0.0 10005:0.0 10006:0.0 10007:1.0 10008:0.0
			</pre>
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
				jq("#step1_text").hide(500);
				jq("#step1_data").hide(500, function() {
					jq("#step2_text").show(500);
					jq("#step2_data").show(500);
				});

			} else if (jq("#step3").attr("class") == "todo"
					&& jq("#step2").attr("class") == "current") {
				// min-max
				jq("#step2").attr("class", "finished");
				jq("#step3").attr("class", "current");
				jq("#step2_text").hide(500);
				jq("#step2_data").hide(500, function() {
					jq("#step3_text").show(500);
					jq("#step3_data").show(500);
				});
			} else if (jq("#step4").attr("class") == "todo"
					&& jq("#step3").attr("class") == "current") {
				// feature hashing
				jq("#step3").attr("class", "finished");
				jq("#step4").attr("class", "current");
				jq("#step3_text").hide(500);
				jq("#step3_data").hide(500, function() {
					jq("#step4_text").show(500);
					jq("#step4_data").show(500);
				});
			} else if (jq("#step5").attr("class") == "todo"
					&& jq("#step4").attr("class") == "current") {
				// libsvm
				jq("#step4").attr("class", "finished");
				jq("#step5").attr("class", "current");
				jq("#step4_text").hide(500);
				jq("#step4_data").hide(500, function() {
					jq("#step5_text").show(500);
					jq("#step5_data").show(500);
				});
				jq("#next").hide();
			}
		}
		jq(document).ready(function() {
			jq("#next").click(changeStep);
		});
	</script>
</body>
</html>