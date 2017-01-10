	//格式化显示时间
    function format(time) {
		//获取分钟和秒
		var min = Math.floor(time/60);
		var sec = Math.floor(time%60);
		//将分钟和秒转换成两位
		if(min.toString().length == 1) {
			min = '0' + min;
		}
		if(sec.toString().length == 1) {
			sec = '0' + sec;
		}
		
		return min + ':' + sec;
	}
	
	var music = document.getElementById('audio');
	//定义歌词数组
	var lyric = [];
	//alert(lrc);
	//绑定timeupdate事件
	music.addEventListener('timeupdate',function(){
		if (!isNaN(music.duration)) {
			var progressValue = music.currentTime/music.duration; //用时间比来获取进度条的值
			if(progressValue == 1){					progressValue=0;//当播放完成，进度条跳到开始
				$("#btn-play").removeClass("glyphicon glyphicon-play ");
				$("#btn-play").addClass("glyphicon glyphicon-pause");
			}
			//显示歌词
			//console.info(music.currentTime);
			//console.info(lyric[lyric.length-1][0]);
			for (var i = 0;i < lyric.length; i++) {
				if (music.currentTime > lyric[i][0] - 1) {
					$('p[name=lyric]').css('color', '#fff'); 
					$('p#'+i).css('color', 'red');

					$('.lyric-content').css('top',210 - 30 * (i + 1));
				};
			};
			//console.info("hello");
			//拖动滑块事件	
			$(function() {
				$( "#slider-range-max" ).slider({
					range: "min",
					max: music.duration,
					value: music.currentTime,
					//step:1,
					animate : true,
					slide:function(event,ui){
						music.currentTime = ui.value;
					}
				});
					
		    });
			//更新音乐时间	
			$("#playTime").text(format(music.currentTime));
			$("#surplusTime").text('/' + format(music.duration));
		}
	},false);
	//调节音量
	$( "#volume" ).slider({
		orientation: "vertical",
		range: "min",
		max: 100,
		value: 50,
		step:1,
		slide: function(event, ui) {
			music.volume = ui.value/100;
			//console.info(music.currentTime);
		}
	});

	//加载歌词
	function loadLyric(lyric) {
		var lyricContent = $('#show-lrc-content');
		lyricContent.html("");
		_.each(lyric, function(content, index, $){
			lyricContent.append('<p name="lyric" id=' + index + '>' + content[1] + '</p>');
		});
	}
	//获取歌词
	function parseLyric(lyric) {
	    var lines = lyric.split('\n'),
	        pattern = /\[\d{2}:\d{2}.\d{2}\]/g,
	        result = [];
	    while (!pattern.test(lines[0])) {
	        lines = lines.slice(1);
	    };
	    lines[lines.length - 1].length === 0 && lines.pop();
	    _.each(lines, function(data, step){
	        var index = data.indexOf(']');
	        var time = data.substring(0, index+1),
	        	value = data.substring(index+1);
        	var timeString = time.substring(1, time.length-2);
        	var timeArr = timeString.split(':');
        	result.push([parseInt(timeArr[0], 10) * 60 + parseFloat(timeArr[1]), value]);

	    });
	    result.sort(function(a, b) {
	        return a[0] - b[0];
	    });
    	return result;
	}
	var path1 = document.getElementById("path").value;
	//console.info(path1);
	//播放器事件
	$(function() {  
        // 播放器  
        var Player = {  
            // 歌曲路径  
            path : path1 + '/music/song/',  
            path2 : path1 + '/music/lrc/',
            // 歌曲数据  
            data : null,  
			
			//歌曲歌词
			lyricSrc : null,
      
            // 当前播放歌曲的 索引  
            currentIndex : -1,  
      
            //播放器元素jquery对象  
            $audio : $('audio'),  
      
            // 歌曲列表  
            $mList : $('#m-list'),  
      
            //正在播放的歌曲  
            $rmusic : $('#rmusic'),  
      
            // 初始化 数据  
            init : function() {  
      
                // 数据一般来自服务器端,通过ajax 加载数据,这里是模拟  
                Player.data = ['追梦赤子心.mp3', '逃跑计划-夜空中最亮的星.mp3'];  
				Player.lyricSrc = ['追梦赤子心.lrc','逃跑计划-夜空中最亮的星.lrc'];
      
                // 一般用模板引擎,把数据 与 模板 转换为 视图,来显示,这里是模拟  
                var mhtml = '';  
                var len = Player.data.length;  
                for (var i = 0; i < len; i++) {  
                    mhtml += '<li><a index="' + i + '">' + Player.data[i].split(".")[0] + '</a></li>';  
                }  
                Player.$mList.html(mhtml);  
            },  
      
            // 就绪  
            ready : function() {  
                // 控制  
                Player.audio = Player.$audio.get(0);  
      
                $('#ctrl-area').on('click', 'button', function() {  
                    //Player.$rmusic.html(Player.data[Player.currentIndex]);  
                });  
				
				//绑定播放暂停控制  
				$('.play').bind('click', function() {  
					playAudio();  
				});   
				  
				var media = $('#audio')[0];   
				
				$('#div-play').bind('click', function() {  
					playAudio();  
				}); 
				
				//播放暂停切换  
				function playAudio() {  
					if(media.paused) {  
						play();  
					} else {  
						pause();  
					}  
				}  
				   
      
                // 播放  
                function play() {  
                    Player.audio.play();  
					//$('#btn-play').text("播放"); 
                };  
      
                // 暂停  
                function pause() {  
                    Player.audio.pause();  
					//var time = media.currentTime/media.duration;;
					//alert(time);
					//$('#music_prog').css("width",360*time);
					//$('#btn-play').text('暂停');
                };  
      
                // 下一曲  
                $('#div-next').click(function() {  
                    if (Player.currentIndex == -1) {  
                        Player.currentIndex = 0;  
                    } else if (Player.currentIndex == (Player.data.length - 1)) {  
                        Player.currentIndex = 0;  
                    } else {  
                        Player.currentIndex++;  
                    }  
					
					$.get(Player.lyricSrc[Player.currentIndex], function(lrc) {
						lyric = parseLyric(lrc);
						//console.info(lyric);
						//debugger
						loadLyric(lyric);
						//palyMusic(0);
					});
					
                    console.log("Player.currentIndex : " + Player.currentIndex);  
                    Player.audio.src = Player.path + Player.data[Player.currentIndex];  
					//console.log( Player.audio.src);
					Player.$rmusic.html(Player.data[Player.currentIndex]);
                    Player.audio.play();  
                });  
      
                // 上一曲  
                $('#div-pre').click(function() {  
                    if (Player.currentIndex == -1) {  
                        Player.currentIndex = 0;  
                    } else if (Player.currentIndex == 0) {  
                        Player.currentIndex = (Player.data.length - 1);  
                    } else {  
                        Player.currentIndex--;  
                    }  
					
					$.get(Player.lyricSrc[Player.currentIndex], function(lrc) {
						lyric = parseLyric(lrc);
						//console.info(lyric);
						//debugger
						loadLyric(lyric);
						//palyMusic(0);
					});
					
                    Player.audio.src = Player.path + Player.data[Player.currentIndex];  
					Player.$rmusic.html(Player.data[Player.currentIndex]);
                    Player.audio.play();  
                });  
				
				 
                Player.audio.onended = function() {	
					 // 单曲循环 
					if(flag2 == 0){
						console.log("Player.currentIndex :", Player.currentIndex); 
                        Player.audio.load();  
                        Player.audio.play();  
						//alert("hah");
					}else if(flag2 == 1){// 顺序播放 
						console.log("Player.currentIndex :", Player.currentIndex); 
						$('#btn-next').click(); 
						//alert("hah1");						
					}else if(flag2 == 2){// 随机播放
						var i = parseInt((Player.data.length - 1) * Math.random());  
                        playByMe(i);
						//alert("hah2");						
					}
                }; 
				  
      
                // 播放指定歌曲  
                function playByMe(i) {  
                    console.log("index:", i);  
                    Player.audio.src = Player.path + Player.data[i];  
                    Player.audio.play();  
                    Player.currentIndex = i;  
                    Player.$rmusic.html(Player.data[Player.currentIndex]); 
					$("#panel-song-title").text(Player.data[Player.currentIndex].split(".")[0]);
					console.info(i);
					//显示歌词
					$.get(Player.path2 + Player.lyricSrc[i], function(lrc) {
						lyric = parseLyric(lrc);
						//console.info(lyric);
						//debugger
						loadLyric(lyric);
						//palyMusic(0);
					});
					//$('#btn-play').text("播放");
                }  
      
                // 歌曲被点击  
                $('#m-list a').click(function() {  
                    playByMe($(this).attr('index'));  
					$("#btn-play").removeClass("glyphicon glyphicon-play ");
					$("#btn-play").addClass("glyphicon glyphicon-pause");
					flag = 0;
                });  
            }  
        };  
      
        Player.init();  
        Player.ready();  
      
    });  