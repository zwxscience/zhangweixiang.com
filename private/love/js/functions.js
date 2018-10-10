
var $window = $(window), gardenCtx, gardenCanvas, $garden, garden;
var clientWidth = $(window).width();
var clientHeight = $(window).height();

$(function () {
    // setup garden

	$loveHeart = $("#loveHeart");
	var offsetX = $loveHeart.width() / 2;
	var offsetY = $loveHeart.height() / 2 - 55;
    $garden = $("#garden");
    gardenCanvas = $garden[0];
	gardenCanvas.width = $("#loveHeart").width();
    gardenCanvas.height = $("#loveHeart").height()
    gardenCtx = gardenCanvas.getContext("2d");
    gardenCtx.globalCompositeOperation = "lighter";
    garden = new Garden(gardenCtx, gardenCanvas);
	
	$("#content").css("width",   $("#code").width());
	$("#content").css("height",  $("#code").height());
   if (screenheight < 900 || screenwidth < 1600) {

           $("#content").css("margin-top", Math.max(($window.height() - $("#content").height()) / 6, 40));
	$("#content").css("margin-left", Math.max(($window.width() - $("#content").width()) /4, 40));

            }else{
	$("#content").css("margin-top", Math.max(($window.height() - $("#content").height()) / 3, 80));
	$("#content").css("margin-left", Math.max(($window.width() - $("#content").width()) / 2, 80));
    }

    $("#loveHeart").hide();
    // renderLoop
    setInterval(function () {
        garden.render();
    }, Garden.options.growSpeed);
});

$(window).resize(function() {
    var newWidth = $(window).width();
    var newHeight = $(window).height();
    if (newWidth != clientWidth && newHeight != clientHeight) {
        location.replace(location);
    }
});
function addImages(times) {
    //$("#images").hide();
    var id=times % 19 ;
    $("#images").html($("#images").html() + "<span id='" +id + "' style='display:none' ><img  src='rili/" + id+ ".jpg'height='110px'><span>");
    //$("#" + id).fadeIn();
   setTimeout("showNewImage("+id+")",1000);
    if (times%19==0 &&times>0) $("#images").html("");
}
var ImageTitarr = new Array();
 ImageTitarr[0]="南信初识"; ImageTitarr[1]="南阶考研"; ImageTitarr[2]="苏州乐园"; ImageTitarr[3]="秦淮河畔"; 
 ImageTitarr[4]="秦皇南戴"; ImageTitarr[5]="家乡林处"; ImageTitarr[6]="赤峰草原"; ImageTitarr[7]="地坛"; 
 ImageTitarr[8]="哈尔滨"; ImageTitarr[9]="北师大校园"; ImageTitarr[10]="秋日山上"; ImageTitarr[11]="天津"; 
 ImageTitarr[12]="香山"; ImageTitarr[13]="长城"; ImageTitarr[14]="十渡"; ImageTitarr[15]="蹦极"; 
 ImageTitarr[16]="海淀领证"; ImageTitarr[17]="蒙山婚礼";ImageTitarr[18]="未来之路";
                  
function changeImages() { 
    var id=count% 19 ;
     
  $("#imageshow img").fadeOut(500);
  $("#imageshow img").hide(); 
  $("#imageshow div").hide(); 
    $("#imageshow img").attr("src","rili/" + id+ ".jpg");
          $("#imageshow div span").html(ImageTitarr[id]);
          $("#imageshow div").fadeIn(800);
    $("#imageshow img").fadeIn(800);
      count++;
    if (count%19==0 &&count>0)
    {
        clearInterval(changeID);
        $("#imageshow div").fadeTo(2000, 0);
    	//  setTimeout($("#imageshow div").hide(),2000);
    	}
}


function showNewImage(id){
$("#" + id).fadeIn();
}

function getHeartPoint(angle) {
	var t = angle / Math.PI;
	var x = 19.5 * (16 * Math.pow(Math.sin(t), 3));
	var y = - 20 * (13 * Math.cos(t) - 5 * Math.cos(2 * t) - 2 * Math.cos(3 * t) - Math.cos(4 * t));
	return new Array(offsetX + x, offsetY + y);
}

function preStartheart() {
 $("#imageshow img").animate({
     marginLeft: "270px",
     marginTop: "350px",
    
 }, 500,"swing",startHeartAnimation());

}

function startHeartAnimation() {
//图片显示
 //$("#imageshow img").css("margin-left","270px");
 //$("#imageshow img").css("margin-top", "350px");
  if (screenheight < 900 || screenwidth < 1600) {
   $("#code").css("width","330px").css("height","600px").css("line-height","20px");
 
  }else
   $("#code").css("width","380px").css("height","630px").css("line-height","22px").css("font-size","13px");


       $loveHeart = $("#loveHeart");
	var offsetX = $loveHeart.width() / 2;
	var offsetY = $loveHeart.height() / 2 - 55;
    $garden = $("#garden");
    
     adjustCodePosition();
     if(parseInt($("#code").css("margin-top"))<0)
     $("#code").css("margin-top","0");
        $("#loveHeart").show();
    $("#content").css("width", $loveHeart.width() + parseInt($("#code").css("width")));
	$("#content").css("height", Math.max($loveHeart.height(), $("#code").height()));
	$("#content").css("margin-top", Math.max(($window.height() - $("#content").height()) / 10, 10));
	 if (screenheight < 900 || screenwidth < 1600) {
   $("#code").css("margin-top","0");
  }
	var interval = 40;
	var angle = 10;
	var heart = new Array();
	var animationTimer = setInterval(function () {
		var bloom = getHeartPoint(angle);
		var draw = true;
		for (var i = 0; i < heart.length; i++) {
			var p = heart[i];
			var distance = Math.sqrt(Math.pow(p[0] - bloom[0], 2) + Math.pow(p[1] - bloom[1], 2));
			if (distance < Garden.options.bloomRadius.max * 1.3) {
				draw = false;
				break;
			}
		}
		if (draw) {
			heart.push(bloom);
			garden.createRandomBloom(bloom[0], bloom[1]);
		}
		if (angle >= 30) {
			clearInterval(animationTimer);
			showMessages();
		} else {
			angle += 0.2;
		}
	}, interval);
	
	//setTimeout(rorate(),60000);
 
}


(function($) {
	$.fn.typewriter = function() {
		this.each(function() {
			var $ele = $(this), str = $ele.html(), progress = 0;
			$ele.html('');
			var timer = setInterval(function() {
				var current = str.substr(progress, 1);
				if (current == '<') {
					progress = str.indexOf('>', progress) + 1;
				}else if (current == '&') {
					progress = str.indexOf(';', progress) + 1;
				} 
                                else {
					progress++;
				}
				$ele.html(str.substring(0, progress) + (progress & 1 ? '_' : ''));
				if (progress >= str.length) {
					clearInterval(timer);
				}
			}, 65);
		});
		return this;
	};
})(jQuery);

function timeElapse(date){
	var current = Date();
	var seconds = (Date.parse(current) - Date.parse(date)) / 1000;
	var days = Math.floor(seconds / (3600 * 24));
	seconds = seconds % (3600 * 24);
	var hours = Math.floor(seconds / 3600);
	if (hours < 10) {
		hours = "0" + hours;
	}
	seconds = seconds % 3600;
	var minutes = Math.floor(seconds / 60);
	if (minutes < 10) {
		minutes = "0" + minutes;
	}
	seconds = seconds % 60;
	if (seconds < 10) {
		seconds = "0" + seconds;
	}
	var result = "<span class=\"digit\">" + days + "</span> days <span class=\"digit\">" + hours + "</span> hours <span class=\"digit\">" + minutes + "</span> minutes <span class=\"digit\">" + seconds + "</span> seconds"; 
	$("#elapseClock").html(result);
}

function showMessages() {
	adjustWordsPosition();
	$('#messages').fadeIn(5000, function() {
		showLoveU();
	});
}

function adjustWordsPosition() {
	$('#words').css("position", "absolute");
	$('#words').css("top", $("#garden").position().top + 195);
	$('#words').css("left", $("#garden").position().left + 70);
}

function adjustCodePosition() {
	$('#code').css("margin-top", ($("#garden").height() - $("#code").height()) / 2);
}

function showLoveU() {
	$('#loveu').fadeIn(3000);
	rorate();
}
function rorate(){

	$("#code").css("-o-transform","rotate(5deg)");
	$("#code").css("-webkit-transform","rotate(5deg)");
	$("#code").css("-moz-transform","rotate(5deg)");
 $("#loveu").fadeOut(1000,function(){$("#loveu").html("野有蔓草 零露瀼瀼").fadeIn(1000,function(){$("#loveu").fadeOut(1000,function(){$("#loveu").html("有美一人 婉如清扬").fadeIn(1000,function(){$("#loveu").fadeOut(1000,function(){$("#loveu").html("邂逅相遇 与子偕臧<div class='signature' style='display:none'></div>").fadeIn(1000,function(){$("#loveu .signature").html("- 爱你的维祥").fadeIn(2500);});});});});});});
}
