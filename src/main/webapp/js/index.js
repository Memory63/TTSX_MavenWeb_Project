$(function () {
    var array=new Array('fresh_list','seafood','meat','egg','vegetables','ice');
    $("#goodsType").load("/TTSX_MavenWeb_Project/goodsType/listGoodsType");
    for (var i=0;i < array.length;i++){
        $("#"+array[i]).load("/TTSX_MavenWeb_Project/goods/queryGoodsByTid?tid="+(i+1)+"&path=list_goods");
    }
})