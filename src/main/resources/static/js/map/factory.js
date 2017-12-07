/*
* @Author: wakouboy
* @Date:   2017-05-02 10:27:31
* @Last Modified by:   wakouboy
* @Last Modified time: 2017-05-03 15:46:46
*/

'use strict';

var pointLoc = {
	10 : '0.7625 0.4693 0.7866  0.492 0.8658  0.3746 0.895   0.4',
	A18: '0.2496    0.3232 0.304   0.3072 0.2604  0.33792 0.316   0.32192',
	A19: '0.3368    0.32384 0.3872  0.3072 0.3508  0.33664 0.3964  0.32128',
	A17: '0.3068    0.27968 0.3448  0.26816 0.3136  0.28864 0.3556  0.27712'
}

for (var key in pointLoc) {

	var points = []
	var attrs = pointLoc[key].split(' ')
	var attrs2 = []
	for (var j in attrs) {
		if (attrs[j] == '') continue
		attrs2.push(attrs[j])
	}
	for (var j = 0; j < 4; j++) {
		points.push([ + attrs2[j * 2], +attrs2[j * 2 + 1]])
	}
	var tmp = points[2]
	points[2] = points[3]
	points[3] = tmp
	// 点按照顺时针排列
	pointLoc[key] = points
}

//公司名称，用电量，用水量，用气量
/* companyName: xxx,
   electricity: 1000,
   water: 10000,
   air: 10000,

*/
var drawFactory = function(divId, factoryData, max, url) {
	// body...
	var width = $('#' + divId).width(),
	height = $('#' + divId).height();
	var svg = d3.select('#' + divId + 'Svg').attr('width', width).attr('height', height).on("click", stopped, true);
	var initialTransform = d3.zoomIdentity.translate(0, 0).scale(1)
	// .scale(0.2);
	var zoom = d3.zoom().on("zoom", zoomed);

	var g = svg.append('g')
	var svg_img = g.append('image').attr('image-rendering', 'optimizeQuality').attr('x', '0').attr('y', '0');

	var img = new Image();
	var active = d3.select(null);

	img.src = url
	var iwidth, iheight

	var tip = d3.tip().attr('class', 'd3-tip').offset([ - 10, 0]).html(function(d) {
		return '<div id=tooltip style= position: absolute; background-color: white;visibility: hidden; padding: 5px;z-index: 10; border:1px solid #ccc; border-radius: 5px>' 
		+ '<div style="margin: 4px; color: #000; font-size: 1em">' + '公司名称：' + factoryData[d.key]['companyName'] + '</div>' 
		+ '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '楼号：' + factoryData[d.key]['factoryNumber'] + '</div>' 
		+ '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '用电量：' + factoryData[d.key]['electricity'] + '千瓦时' + '</div>'
		+ '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '用水量：' + factoryData[d.key]['water'] + '立方米' + '</div>'
		//+  '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '用气量：' + factoryData[d.key]['air'] +'</div>'
		+ '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '能耗状态：' + factoryData[d.key]['energyState'] +'</div>'
 		+ '<div style="margin: 4px; color: #000; font-size: 0.9em">'+ '标煤排放：' + factoryData[d.key]['biaomei'] + '吨' +'</div>'
		+ '<div style="margin: 4px; color: #000; font-size: 0.9em">'+ '万元GDP：' + factoryData[d.key]['wygdp'] +'</div>'
		+ '</div>'

		+ '</div>'
	})

	svg.call(tip)

	img.onload = function() {
		iwidth = this.width;

		iheight = this.height;

		svg_img.attr('height', iheight).attr('width', iwidth).attr('xlink:href', url)

		var color = d3.scaleLinear().domain([0, max]).range(['green', 'red'])

		var lineFunction = d3.line().x(function(d) {
			return d[0] * iwidth;
		}).y(function(d) {
			return d[1] * iheight;
		})

		svg.append("rect").attr("width", width).attr("height", height).style('fill', 'none')
		// .style('pointer-events','all')
		.on("click", reset);

		for (var key in factoryData) {
			// console.log(factoryData[key])
			var elec = factoryData[key].electricity
			// console.log(key, pointLoc[key])
			pointLoc[key].push(pointLoc[key][0])
			g.append('path').datum({
				'key': key,
				'data': pointLoc[key]
			}).attr('d', lineFunction(pointLoc[key])).attr("stroke", 'none')
			// .attr("stroke-width", 1)
			.attr("fill", color(elec)).style('opacity', 0).on('click', clicked).on("mouseover",
			function(d) {

				// $('#tooltip').empty()
				// $('#tooltip').append('<div style="color: #000; font-size: 1em">' + '' + factoryData[d.key]['companyName'] +'</div>')
				// $('#tooltip').append('<div style="color: #000; font-size: 0.9em">' + '用电量：' + factoryData[d.key]['electricity'] +'</div>')
				// $('#tooltip').append('<div style="color: #000; font-size: 0.9em">' + '用水量：' + factoryData[d.key]['water'] +'</div>')
				// $('#tooltip').append('<div style="color: #000; font-size: 0.9em">' + '用气量：' + factoryData[d.key]['air'] +'</div>')
				// $('#tooltip').css("visibility", "visible");
			}).on("mousemove", tip.show)
			// $('#tooltip').css("top", (event.pageY-10)+"px").css("left",(event.pageX+10)+"px");
			.on("mouseout", tip.hide)
			// $('#tooltip').css("visibility", "hidden");
			// .append('title')
			// .text(function(){
			//     var text = '公司名称: ' + factoryData[key]['companyName'] +'\n';
			//     text = text + '用电量: ' + factoryData[key]['electricity'] + '\n';
			//     text = text + '用水量: '  + factoryData[key]['water'] + '\n';
			//     text = text + '用气量: ' + factoryData[key]['air'];
			//     return text
			// })
		}

	}

	svg.call(zoom) // delete this line to disable free zooming .call(zoom.transform, initialTransform);

	function zoomed() {
		var transform = d3.event.transform;

		g.style("stroke-width", 1.5 / transform.k + "px");
		g.attr("transform", transform);
	}
	function reset() {
		active.classed("active", false);
		active = d3.select(null);
		svg.transition().duration(750).call(zoom.transform, initialTransform);
	}

	function clicked(d) {

		console.log(d);
		//d.key 是厂房的id
		//d.data 是厂房的位置
		// window.open('https://www.baidu.com')
		window.location.href = "index_ssjc.html?params=" + d.key;
	}
	function stopped() {
		if (d3.event.defaultPrevented) d3.event.stopPropagation();
	}

}