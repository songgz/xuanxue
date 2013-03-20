


require 'cdate'
require 'goleph.rb'
require 'time'

  

def main()


	if ARGV.length < 1
		puts "Usage: ruby ziwei.rb <born datetime> [<today datetime>]"
		return
	end



	v = {}
	v["天干"] 	= 	[ "甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸" ]
	v["地支"] 	= 	[ "子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
	v["月"] 		= 	['十一','十二','正','二','三','四','五','六','七','八','九','十']

	v["十二宫"]  = 	[ "命宫", "兄弟", "夫妻", "子女", "财帛", "疾厄", "迁移", "仆役", "官禄", "田宅", "福德", "父母"]
	v["五行"] 	= 	[ "金","木","水","火","土"]
	v["五行局"] 	=	[ "水二","木三","金四","土五","火六" ]
	v["长生"] 	= 	[ "长生" ,"沐浴" ,"冠带", "临官", "帝旺", "衰", "病", "死", "墓", "绝" ,"胎" ,"养"]

	o = {}
	o["五虎遁"] = [ 2,4,6,8,0,2,4,6,8,0]
	o["五鼠遁"] = [ 0,2,4,6,8,0,2,4,6,8]


	o["五行局"]	= { 
					[ 0,0 ] =>2, [ 0, 1] =>2, [ 0,6 ] =>2, [ 0, 7] =>2, 
					[ 1,0 ] =>2, [ 1, 1] =>2, [ 1,6 ] =>2, [ 1, 7] =>2, 
					[ 0,2 ] =>0, [ 0, 3] =>0, [ 0,8 ] =>0, [ 0, 9] =>0, 
					[ 1,2 ] =>0, [ 1, 3] =>0, [ 1,8 ] =>0, [ 1, 9] =>0, 
					[ 0,4  ]=>4, [ 0, 5 ]=>4, [ 0,10 ]=>4, [ 0, 11]=>4, 
					[ 1,4  ]=>4, [ 1, 5 ]=>4, [ 1,10 ]=>4, [ 1, 11]=>4, 
										
					[ 2,0 ] =>0, [ 2, 1] =>0, [ 2,6 ] =>0, [ 2, 7] =>0, 
					[ 3,0 ] =>0, [ 3, 1] =>0, [ 3,6 ] =>0, [ 3, 7] =>0, 
					[ 2,2 ] =>4, [ 2, 3] =>4, [ 2,8 ] =>4, [ 2, 9] =>4, 
					[ 3,2 ] =>4, [ 3, 3] =>4, [ 3,8 ] =>4, [ 3, 9] =>4, 
					[ 2,4  ]=>3, [ 2, 5 ]=>3, [ 2,10 ]=>3, [ 2, 11]=>3, 
					[ 3,4  ]=>3, [ 3, 5 ]=>3, [ 3,10 ]=>3, [ 3, 11]=>3, 
					
					[ 4,0 ] =>4, [ 4, 1] =>4, [ 4,6 ] =>4, [ 4, 7] =>4, 
					[ 5,0 ] =>4, [ 5, 1] =>4, [ 5,6 ] =>4, [ 5, 7] =>4, 
					[ 4,2 ] =>3, [ 4, 3] =>3, [ 4,8 ] =>3, [ 4, 9] =>3, 
					[ 5,2 ] =>3, [ 5, 3] =>3, [ 5,8 ] =>3, [ 5, 9] =>3, 
					[ 4,4  ]=>1, [ 4, 5 ]=>1, [ 4,10 ]=>1, [ 4, 11]=>1, 
					[ 5,4  ]=>1, [ 5, 5 ]=>1, [ 5,10 ]=>1, [ 5, 11]=>1, 

					[ 6,0 ] =>3, [ 6, 1] =>3, [ 6,6 ] =>3, [ 6, 7] =>3, 
					[ 7,0 ] =>3, [ 7, 1] =>3, [ 7,6 ] =>3, [ 7, 7] =>3, 
					[ 6,2 ] =>1, [ 6, 3] =>1, [ 6,8 ] =>1, [ 6, 9] =>1, 
					[ 7,2 ] =>1, [ 7, 3] =>1, [ 7,8 ] =>1, [ 7, 9] =>1, 
					[ 6,4  ]=>2, [ 6, 5 ]=>2, [ 6,10 ]=>2, [ 6, 11]=>2, 
					[ 7,4  ]=>2, [ 7, 5 ]=>2, [ 7,10 ]=>2, [ 7, 11]=>2, 
					
					[ 8,0 ] =>1, [ 8, 1] =>1, [ 8,6 ] =>1, [ 8, 7] =>1, 
					[ 9,0 ] =>1, [ 9, 1] =>1, [ 9,6 ] =>1, [ 9, 7] =>1, 
					[ 8,2 ] =>2, [ 8, 3] =>2, [ 8,8 ] =>2, [ 8, 9] =>2, 
					[ 9,2 ] =>2, [ 9, 3] =>2, [ 9,8 ] =>2, [ 9, 9] =>2, 
					[ 8,4  ]=>0, [ 8, 5 ]=>0, [ 8,10 ]=>0, [ 8, 11]=>0, 
					[ 9,4  ]=>0, [ 9, 5 ]=>0, [ 9,10 ]=>0, [ 9, 11]=>0, 
					
				}


	o["长生"] 	= [ 8, 11, 6, 2, 2 ]
	o["天府"] 	= [ 4, 3, 2, 1, 0, 11, 10, 9 , 8 ,7 , 6, 5 ]
	o["天魁"] 	= [  1,  0, 11,11, 1,0,   1,6,5,5   ]
	o["天钺"] 	= [  7,  8,  9, 9, 7,8,   7,2,3,3   ]
	o["禄存"] 	= [  2, 3,  5, 6 ,5,   6, 8,9, 11, 0]   
	o["火星"]	= [ 2,  3,1, 9,  2, 3,1, 9,  2, 3,1, 9  ]
	o["铃星"] 	= [ 10,10,3,10, 10,10,3,10, 10,10,3,10  ]
	o["天马"] 	= [ 2,11,8,5, 2,11,8,5, 2,11,8,5  ]


	v["星"] = [ 
				"紫薇","天机","太阳","武曲","天同","廉贞",   				#0-5
				"天府","太阴","贪狼","巨门","天相","天梁","七杀","破军",		#6-13
				"左辅","右弼","文曲","文昌","天魁","天钺","禄存",			#14-20
				"擎羊","陀螺","火星","铃星","地空","地劫",					#21-26
				"天马","红鸳","天喜","孤辰","寡宿","天刑","天姚","天德","年解", #27-35
				"天官","天福","天厨","截路","空亡","解神","天巫","天月","阴煞","台辅","封诰", #36-46
				"流昌","流曲","流魁","流钺","流禄","流羊","流陀","流鸳","流喜"  #47-55
			]

	xi = {}
	v["星"].each_index { |i| 
		xi[v["星"][i]] = i
	}

	v["十干四化"] = [ "禄","权","科","忌"]
	o["十干四化"] = [
						[ "廉贞", "破军" ,"武曲","太阳" ],
						[ "天机", "天梁" ,"紫薇","太阴" ],
						[ "天同", "天机" ,"文昌","廉贞" ],
						[ "太阴", "天同" ,"天机","巨门" ],
						[ "贪狼", "太阴" ,"右弼","天机" ],
						[ "武曲", "贪狼" ,"天梁","文曲" ],
						[ "太阳", "武曲" ,"天府","天同" ],
						[ "巨门", "太阳" ,"文曲","文昌" ],
						[ "天梁", "紫薇" ,"左辅","武曲" ],
						[ "破军", "巨门" ,"太阴","贪狼" ]
					]	


	o["地支庙陷"] = [
		# 紫薇 ,天机, 太阳, 武曲, 天同. 廉贞
		[ 2, 1, 1, 1, 2, 1,  1, 1, 1, 1, 2, 1 ],
		[ 1,-1, 2, 1, 2, 2,  1,-1, 2, 1, 2, 2 ],
		[-1,-1, 1, 1, 1, 1,  1, 2, 2, 2,-1,-1 ],
		[ 1, 1, 2, 2, 1, 2,  1, 1, 2, 2, 1, 2 ],
		[ 1,-1,2,2,2,1,-1,-1,1,2,2,1],
		[2,2,1,2,2,-1,2,2,1,2,2,-1],
		
		# 天府，太阴，贪狼， 巨门，天相，天梁， 七杀， 破军
		[1,1,1,2,1,2,1,1,2,1,1,2],
		[1,1,1,-1,-1,-1,-1,-1,2,1,1,1],
		[1,1,2,2,1,-1,1,1,2,2,1,-1],
		[1,-1,1,1,-1,1,1,-1,1,1,-1,1],
		[1,1,1,-1,2,2,1,2,1,-1,2,2],
		[1,1,1,1,1,-1,1,1,-1,2,1,-1],
		[1,1,1,1,1,2,1,1,1,1,1,2],
		[1,1,2,-1,1,2,1,1,2,-1,1,2],
		
		# 左辅， 右弼， 文曲， 文昌， 天魁， 天钺， 禄存
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[2,1,2,1,2,1,-1,1,2,1,-1,1],
		[2,1,-1,2,2,1,-1,2,2,1,-1,2],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[1,0,1,1,0,1,1,0,1,1,0,1],
		
		# 擎羊，陀螺， 火星，铃星 ,地空，地劫
		[-1,1,0,-1,1,0,-1,1,0,-1,1,0],
		[0,1,-1,0,1,-1,0,1,-1,0,1,-1],
		[-1,2,1,2,-1,2,1,2,-1,2,1,2],
		[-1,2,1,2,-1,2,1,2,-1,2,1,2],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		
		# 天马， 红鸳， 天喜 ， 孤辰 ，寡宿, 天刑， 天姚， 天德， 年解
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[2,-1,1,1,2,2,2,-1,2,1,1,2],
		[2,-1,2,1,2,2,2,-1,2,1,1,1],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0],
		
	]




	nongli = CDate.new()
	

	# Born date
	dt = DateTime.parse( ARGV[0] )
	nongdate = nongli.to_ccal( dt )
	sizhu 		= nongli.bazi( dt )
	
	# Today / User selected today date
	dt_today = ARGV[1] != nil ? DateTime.parse( ARGV[1] ) : DateTime.now() 
	nongdate_today = nongli.to_ccal( dt_today) 
	sizhu_today	= nongli.bazi( dt_today )
	
	# 命宫，身宫	
	minggong = (nongdate[:imonth] + 2 - sizhu[3][1])	% 12
	shengong = (nongdate[:imonth] + 2 + sizhu[3][1])  	% 12
	

	#五局
	monthoff = []
	monthoff[0] = o["五虎遁"][  sizhu[0][0] ]
	monthoff[1] = o["五虎遁"][  (sizhu[0][0] + 1) % 10 ]

	effective_monthoff = monthoff[ minggong < 2 ? 1 : 0 ]
	wuxingju = o["五行局"][[ (effective_monthoff + minggong - 2) % 10 ,minggong] ]

	print v["五行局"][ wuxingju],"局"
	puts ""

	changshen_off = o["长生"][wuxingju]
	puts "\n\n"
	

	# 14 主星
	

	# 紫薇 ,天机, 太阳, 武曲, 天同. 廉贞
	xp = []
	lrxp = []


	x = 0
	(0...6).each { |i|
		if ( nongdate[:iday] + 1 + i ) % ( wuxingju + 2 ) == 0
			x = i
			break
		end
	}
	y = (nongdate[:iday] + 1 + x) / ( wuxingju + 2 )
	
	if x % 2 == 0
		xp[xi["紫薇"]] = (y + 1 + x) % 12
	else
		xp[xi["紫薇"]] = (y + 1 - x) % 12
	end

	
	xp[xi["天机"]] = (xp[xi["紫薇"]] - 1) % 12
	xp[xi["太阳"]] = (xp[xi["紫薇"]] - 3) % 12
	xp[xi["武曲"]] = (xp[xi["紫薇"]] - 4) % 12
	xp[xi["天同"]] = (xp[xi["紫薇"]] - 5) % 12
	xp[xi["廉贞"]] = (xp[xi["紫薇"]] - 8) % 12

	# 天府，太阴，贪狼， 巨门，天相，天梁， 七杀， 破军
	xp[xi["天府"]] 	= o["天府"][xp[xi["紫薇"]]]
	xp[xi["太阴"]]	= (xp[xi["天府"]] + 1 ) % 12
	xp[xi["贪狼"]]	= (xp[xi["天府"]] + 2 ) % 12
	xp[xi["巨门"]]	= (xp[xi["天府"]] + 3 ) % 12
	xp[xi["天相"]]	= (xp[xi["天府"]] + 4 ) % 12
	xp[xi["天梁"]]	= (xp[xi["天府"]] + 5 ) % 12
	xp[xi["七杀"]]	= (xp[xi["天府"]] + 6 ) % 12
	xp[xi["破军"]]	= (xp[xi["天府"]] + 10 ) % 12


	# 13 吉凶星

	# 7 吉星
	# 左辅， 右弼， 文曲， 文昌， 天魁， 天钺， 禄存
	xp[xi["左辅"]] = (4 + nongdate[:imonth]) % 12
	xp[xi["右弼"]] = (10 - nongdate[:imonth]) % 12
	xp[xi["文曲"]] = (4 + sizhu[3][1] ) % 12
	xp[xi["文昌"]] = (10 - sizhu[3][1]) % 12
	xp[xi["天魁"]] = o["天魁"][sizhu[0][0]] 
	xp[xi["天钺"]] = o["天钺"][sizhu[0][0]]
	xp[xi["禄存"]] = o["禄存"][sizhu[0][0]]


	



	# 6 凶星
	# 擎羊，陀螺， 火星，铃星 ,地空，地劫
	xp[xi["擎羊"]] = (xp[xi["禄存"]] + 1) % 12
	xp[xi["陀螺"]] = (xp[xi["禄存"]] - 1) % 12
	xp[xi["火星"]] = (o["火星"][sizhu[0][1]] + sizhu[3][1]) % 12
	xp[xi["铃星"]] = (o["铃星"][sizhu[0][1]] + sizhu[3][1]) % 12
	xp[xi["地空"]] = (11 - sizhu[3][1]) % 12
	xp[xi["地劫"]] = (11 + sizhu[3][1]) % 12


	# 杂耀星
	# 天马， 红鸳， 天喜 ， 孤辰 ，寡宿, 天刑， 天姚， 天德， 年解
	xp[xi["天马"]]  = o["天马"][sizhu[0][1]]
	xp[xi["红鸳"]]  = (3 - sizhu[0][1]) % 12	
	xp[xi["天喜"]]  = (xp[xi["红鸳"]] + 6) % 12

	trio_grp = ((sizhu[0][1] + 1) % 12) / 3
	trio_grp_next = [2,5,8,11]
	trio_grp_prev = [10,7,4,1]
	xp[xi["孤辰"]] = trio_grp_next[trio_grp]
	xp[xi["寡宿"]] = trio_grp_prev[trio_grp]

	xp[xi["天刑"]] = (9 + nongdate[:imonth])  % 12
	xp[xi["天姚"]] = (1 + nongdate[:imonth])  % 
	xp[xi["天德"]] = (9 + sizhu[0][1]) % 12
	xp[xi["年解"]] = (10 - sizhu[0][1]) % 12


	# 十干四化
	sihua = o["十干四化"][ sizhu[0][0] ]



	# "天官","天福","天厨","截路","空亡","解神",
	xp[xi["天官"]] = [7,4,5,2,3,9,11,9,10,6][sizhu[0][0]]
	xp[xi["天福"]] = [9,8,0,11,3,2,6,5,6,5][sizhu[0][0]]
	xp[xi["天厨"]] = [5,6,0,5,6,8,2,6,9,11][sizhu[0][0]]
	xp[xi["截路"]] = [8,6,4,2,0,8,6,4,2,0][sizhu[0][0]]
	xp[xi["空亡"]] = [9,7,5,3,1,9,7,5,3,1][sizhu[0][0]]

	# "天巫","天月","阴煞",
	xp[xi["天巫"]] = [5,8,2,11,5,8,2,11,5,8,2,11][nongdate[:imonth]]
	xp[xi["天月"]] = [10,5,4,2,7,3, 11, 7,2,6,10,2][nongdate[:imonth]]
	xp[xi["阴煞"]] = [2,0,10,8,6,4, 2, 0, 10,8,6,4][nongdate[:imonth]]
			
	#"台辅","封诰"
	xp[xi["台辅"]] = [6,7,8,9,10,11,0,1,2,3,4,5][sizhu[3][1]]
	xp[xi["封诰"]] = [2,3,4,5,6,7,8,9,10,11,0,1][sizhu[3][1]]
		


	#------------------------
	#先天盘
	print12gong( minggong , "先天盘" , nongdate , sizhu , v , monthoff , xp, xi , changshen_off, o, sihua)


	#--------------------
	# 流年
	lnminggong = sizhu_today[0][1]
	print12gong( lnminggong , "流年盘" , nongdate_today , sizhu_today , v , monthoff , xp , xi , nil, o, sihua)

	#-----------
	#-流月
	doujun = (lnminggong - nongdate[:imonth] + sizhu[3][1]) % 12
	lyminggong = (nongdate_today[:imonth] + doujun) % 12
	print12gong( lyminggong , "流月盘" , nongdate_today , sizhu_today , v , monthoff , xp , xi , nil, o, sihua)

	#-----------------
	# 流日
	
	
	xp[xi["流昌"]] = (5 + nongdate_today[:iday] ) % 12
	xp[xi["流曲"]] = (9 - nongdate_today[:iday] ) % 12
	
	xp[xi["流钺"]] = o["天魁"][ sizhu_today[0][0]] 
	xp[xi["流魁"]] = o["天钺"][ sizhu_today[0][0]]

	xp[xi["流鸳"]] = (3 - sizhu_today[0][1]) % 12	
	xp[xi["流喜"]] = (xp[xi["流鸳"]] + 6) % 12
	xp[xi["流禄"]] = o["禄存"][sizhu_today[0][0]]
	xp[xi["流羊"]] = (xp[xi["流禄"]] + 1) % 12
	xp[xi["流陀"]] = (xp[xi["流禄"]] - 1) % 12
	

	lrminggong = (lyminggong + nongdate_today[:iday])  % 12
	print12gong( lrminggong , "流日盘" , nongdate_today , sizhu_today , v , monthoff , xp , xi , nil, o, sihua)


	#--------------------
	#流时

	lsminggong = ( lrminggong + sizhu_today[3][1] ) % 12
	print12gong( lsminggong , "流时盘" , nongdate_today , sizhu_today , v , monthoff  , xp , xi , nil, o, sihua)



end


#-----------------------
def horizontalline
	puts "\n\n"
	print "-" * 80
	puts "\n\n"
end

#-----------------------
def print12gong(mg, title , nd , sz , v , monthoff , lrxp , xi , cs , o , sihua)

	horizontalline
	puts title
	puts "#{ nd[:cmonth] }月 #{ nd[:cday]}"
	(0...4).each { |i|
		print "#{v["天干"][sz[i][0]]}#{v["地支"][sz[i][1]]} "
	}
	puts "\n\n"
	(0...12).each do |i|

		effective_monthoff = monthoff[ i < 2 ? 1 : 0 ]
		gan =  (effective_monthoff + i - 2) % 10

		print v["天干"][gan],v["地支"][i]," "
		print v["十二宫"][ (12 - (i - mg )) % 12]
		print "\t"

		print " ",v["长生"][ (i - cs) % 12 ],"\t" if cs != nil


		xi.values.each { |xid| 
			
			if lrxp != nil && lrxp[xid] == i

				sihua_text = ""
				(0...4).each { |sihua_i| 
					if xi[sihua[sihua_i]] == xid 
						sihua_text = v["十干四化"][sihua_i]
					end 
				}

				print v["星"][xid]

				if cs != nil && xid < 36
					print ["陷","","平","旺"][ o["地支庙陷"][xid][i] + 1 ]
					print sihua_text.length > 0 ? "(#{sihua_text})"  : ""
				end
				print "  " 
			end
		}

		puts ""
	end

end

main
