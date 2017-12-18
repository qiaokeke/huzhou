/*
* @Author: wakouboy
* @Date:   2017-05-02 10:27:31
* @Last Modified by:   wakouboy
* @Last Modified time: 2017-05-03 15:46:46
*/

'use strict';

// var pointLoc= {
//     A22: '0.437 0.30656 0.4538  0.29952 0.4638  0.33824 0.493   0.32928',
//     A18: '0.2496    0.3232 0.304   0.3072 0.2604  0.33792 0.316   0.32192',
//     A19: '0.3368    0.32384 0.3872  0.3072 0.3508  0.33664 0.3964  0.32128',
//     A17: '0.3068    0.27968 0.3448  0.26816 0.3136  0.28864 0.3556  0.27712'
// }

var pointLoc= {
    '1#' :'0.413 0.3168 0.425 0.3097 0.423 0.32097 0.424 0.32258',
    A22: '0.437 0.30656 0.4538  0.29952 0.4638  0.33824 0.493   0.32928',
    A18: '0.2496    0.3232 0.304   0.3072 0.2604  0.33792 0.316   0.32192',
    A19: '0.3368    0.32384 0.3872  0.3072 0.3508  0.33664 0.3964  0.32128',
    A17: '0.3068    0.27968 0.3448  0.26816 0.3136  0.28864 0.3556  0.27712',
    A1:  '0.0914 0.31008 0.1266 0.29984 0.0994 0.34208 0.1386 0.32928',
    A2:  '0.0994 0.34208 0.1386 0.32928 0.1114 0.3792 0.1538 0.36256',
    A3:  '0.1178 0.39456 0.1586 0.38176 0.1306 0.42656 0.1714 0.40992',
    A5:  '0.1306 0.42656 0.1714 0.40992 0.1378 0.45472 0.1826 0.44064',
    A6:  '0.1522 0.29344 0.185 0.28576 0.1666 0.32032 0.201 0.31136',
    A7:  '0.1666 0.32032 0.201 0.31136 0.1834 0.35616 0.2202 0.34208',
    A8:  '0.1906 0.37024 0.229 0.35744 0.2042 0.39712 0.2426 0.3856',
    A9:  '0.2024 0.39712 0.2426 0.3856 0.2178 0.42656 0.2602 0.41248',
    A10: '0.2154 0.26656 0.2458 0.2576 0.2266 0.28192 0.2594 0.27296',
    A11: '0.2338 0.30112 0.2834 0.28192 0.241 0.31008 0.293 0.29472',

    A12: '0.249 0.32288 0.3042 0.30496 0.261 0.33824 0.3138 0.32032',

    A15: '0.2674 0.34592 0.3218 0.32672 0.2794 0.36128 0.333 0.34208',

    A16: '0.2986 0.24608 0.325 0.23712 0.3114 0.25632 0.3386 0.24992',

    V11: '0.2938 0.37792 0.3094 0.3728 0.3026 0.39072 0.3154 0.38176',

    V12: '0.3026 0.39072 0.3154 0.38176 0.3122 0.40736 0.3282 0.40224',

    V10: '0.4242 0.39712 0.4402 0.38688 0.4354 0.4048 0.4514 0.3984',

    V9: '0.4754 0.39968 0.489 0.39072 0.4874 0.40992 0.5026 0.40224',

    A20: '0.3514 0.24096 0.3762 0.232 0.3746 0.25888 0.4002 0.25248',

    A21: '0.3746 0.25888 0.4002 0.25248 0.4026 0.28192 0.4266 0.27552',

    V6: '0.473 0.35616 0.4874 0.35168 0.485 0.36576 0.4982 0.35872',

    V7: '0.5066 0.38752 0.5178 0.38048 0.5234 0.40032 0.537 0.392',

    V8: '0.5234 0.40032 0.537 0.392 0.5446 0.42272 0.5558 0.41376',

    V1: '0.4994 0.34528 0.5098 0.33824 0.515 0.35616 0.5262 0.34848',

    V2: '0.515 0.35616 0.5262 0.34848 0.5326 0.37344 0.5434 0.36512',

    V3: '0.5606 0.39584 0.5702 0.3888 0.5778 0.40736 0.5882 0.39904',

    V5: '0.5778 0.40736 0.5882 0.39904 0.599 0.42848 0.6114 0.4208',
    B1: '0.0498 0.2832 0.0858 0.27168 0.0562 0.30368 0.0906 0.29088',

    B2: '0.0858 0.27168 0.1322 0.26272 0.0906 0.29088 0.1362 0.27936',

    B3: '0.1322 0.26272 0.157 0.25632 0.1362 0.27936 0.1642 0.2704',

    B5: '0.1706 0.25888 0.1946 0.2512 0.1778 0.27168 0.201 0.26528',

    B6: '0.1946 0.2512 0.2178 0.2448 0.201 0.26528 0.2242 0.2576',

    B7: '0.2178 0.2448 0.2354 0.24096 0.2242 0.2576 0.245 0.25248',

    B8: '0.2802 0.22176 0.301 0.21536 0.2922 0.23584 0.3098 0.22944',

    B9: '0.301 0.21536 0.3234 0.21664 0.3098 0.22944 0.3322 0.232',

    B10: '0.3234 0.21664 0.341 0.21152 0.3322 0.232 0.349 0.22688',

    B11: '0.341 0.21152 0.3666 0.20512 0.349 0.22688 0.3738 0.21664'
}

for(var key in pointLoc) {

    var points = []
    var attrs = pointLoc[key].split(' ')
    var attrs2 = []
    for(var j in attrs){
        if(attrs[j]=='') continue
        attrs2.push(attrs[j])
    }
    for(var j =0;j<4;j++){
        points.push([+attrs2[j*2], +attrs2[j*2+1]])
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
var drawFactory = function (divId, factoryData, max, url) {
    // body...
    var width = $('#' + divId).width(),
        height = $('#' + divId).height();
    var svg = d3.select('#' + divId + 'Svg').attr('width',width).attr('height',height)
                .on("click", stopped, true);
    var initialTransform = d3.zoomIdentity
        .translate(0,0)
        .scale(0.2);

    var zoom = d3.zoom()
                 .on("zoom", zoomed);

    var g = svg.append('g')
    var svg_img = g.append('image')
       .attr('image-rendering','optimizeQuality')
       .attr('x','0')
       .attr('y','0');

    var img = new Image();
    var active = d3.select(null);

    img.src = url
    var iwidth,iheight

    var tip = d3.tip()
      .attr('class', 'd3-tip')
      .offset([-10, 0])
      .html(function(d) {
         return '<div id=tooltip style= position: absolute; background-color: white;visibility: hidden; padding: 5px;z-index: 10; border:1px solid #ccc; border-radius: 5px>'
                +  '<div style="margin: 4px; color: #000; font-size: 1em">' + '公司名称：' + factoryData[d.key]['companyName'] +'</div>'
				+  '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '楼号：'+factoryData[d.key]['factoryNumber'] +'</div>'
                +  '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '用电量：' + factoryData[d.key]['electricity'] +'千瓦时'+'</div>'
                +  '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '用水量：' + factoryData[d.key]['water'] +'立方米'+'</div>'
                //+  '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '用气量：' + factoryData[d.key]['air'] +'</div>'
				+  '<div style="margin: 4px; color: #000; font-size: 0.9em">' + '能耗状态：' + factoryData[d.key]['energyState'] +'</div>'
				
            +'</div>'
      })

    svg.call(tip)

    img.onload = function() {
        iwidth = this.width;
        iheight = this.height;
        svg_img.attr('height', iheight)
                .attr('width',iwidth)
                .attr('xlink:href', url)

        var color = d3.scaleLinear().domain([0, max]).range(['green','red'])

        var lineFunction = d3.line()
                             .x(function(d) { return d[0] * iwidth; })
                             .y(function(d) { return d[1] * iheight; })



        svg.append("rect")
            .attr("width", width)
            .attr("height", height)
            .style('fill','none')
            // .style('pointer-events','all')
            .on("click", reset);

        for(var key in factoryData){
            // console.log(factoryData[key])
            var elec = factoryData[key].electricity
            // console.log(key, pointLoc[key])
            pointLoc[key].push(pointLoc[key][0])
            g.append('path')
                    .datum({'key': key, 'data':pointLoc[key]})
                    .attr('d', lineFunction(pointLoc[key]))
                    .attr("stroke", 'none')
                    // .attr("stroke-width", 1)
                    .attr("fill", color(elec))
                    .style('opacity',0)
                    .on('click',clicked)
                    .on("mouseover", function(d){

                        // $('#tooltip').empty()
                        // $('#tooltip').append('<div style="color: #000; font-size: 1em">' + '' + factoryData[d.key]['companyName'] +'</div>')
                        // $('#tooltip').append('<div style="color: #000; font-size: 0.9em">' + '用电量：' + factoryData[d.key]['electricity'] +'</div>')
                        // $('#tooltip').append('<div style="color: #000; font-size: 0.9em">' + '用水量：' + factoryData[d.key]['water'] +'</div>')
                        // $('#tooltip').append('<div style="color: #000; font-size: 0.9em">' + '用气量：' + factoryData[d.key]['air'] +'</div>')
                        // $('#tooltip').css("visibility", "visible");
                    })
                    .on("mousemove", tip.show)
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


    svg
        .call(zoom) // delete this line to disable free zooming
        .call(zoom.transform, initialTransform);

    
    function zoomed() {
      var transform = d3.event.transform; 

      g.style("stroke-width", 1.5 / transform.k + "px");
      g.attr("transform", transform);
    }
    function reset() {
      active.classed("active", false);
      active = d3.select(null);
      svg.transition()
          .duration(750)
          .call(zoom.transform, initialTransform);
    }

    function clicked(d) {

      console.log("rootSsjc?aCode="+d.key+"&cName="+factoryData[d.key]['companyName']);
      console.log(factoryData[d.key]['companyName']);
      //d.key 是厂房的id
      //d.data 是厂房的位置
      // window.open('https://www.baidu.com')
        window.location.href = encodeURI("userSsjc.html?aCode="+d.key+"&cName="+  factoryData[d.key]['companyName']);
    }
    function stopped() {
      if (d3.event.defaultPrevented) d3.event.stopPropagation();
    }


}








