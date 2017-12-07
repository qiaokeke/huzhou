// var condition = 'healthy';
var condition = 'danger'
if (condition === 'danger') {
    $("#warming-div").css('backgroundColor', '#fed6da');
} else if(condition === 'healthy'){
    $("#warming-div").css('backgroundColor', '#bbf9d4');
    $("#warming-text").html("贵司本月用能情况健康！");
}