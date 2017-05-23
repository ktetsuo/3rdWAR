#struct code
'初期設定
wndpos ownerwnd%,10,10,710,500
bload "jiki.bmp",jiki
bload "tama.bmp",tama
bload "ene.bmp",ene
bload "entama.bmp",ent
x=300:y=380

ten=0
tuka=0
funsai=0
han=0
'オープニング
for i=0 to 255
textout 15,50,":::3rd WAR::: ver 1.0 ",0,rgb(i,i,i),100,30
locate 30,10
color 0,rgb(i,i,i)
print "Made by カンテツ"
next i
color 7,0
sleep 100
locate 10,12 
print "←↑↓→キー:移動    スペースキー:弾発射 "
sleep 100
print "       難易度を設定してからエンターキーを押すと始まります。"
'ゲーム
*start
gosub *level
cls 3
gosub *game:gosub *game2:gosub *game3:gosub *game4:goto *1
*game
haba=rnd(1)*100+100
iti=rnd(10)*300+50
mov=-2.5

return
*game2
haba2=rnd(11)*100+100
iti2=rnd(13)*300+250
mov2=-3
return
*game3
haba3=rnd(3)*100+100
iti3=rnd(12)*300+150
mov3=-4
return

*game4
haba4=rnd(14)*100+100
iti4=rnd(5)*300+200
mov4=-1.5
return
*1:'動いている
*ene1
ex=sin(mov+3.14)*haba+iti
ey=mov*esp+0.1
mov=mov+0.047
if ey>500 then tuka=tuka+1:gosub *game
put@(ex,ey),ene,pset
gosub *et

*ene2
ex2=sin(mov2-3.14/2)*haba2+iti2
ey2=mov2*esp+0.3
mov2=mov2+0.047
if ey2>500 then tuka=tuka+1:gosub *game2
put@(ex2,ey2),ene,pset
gosub *et2

*ene3
ex3=sin(mov3+3.14/2)*haba3+iti3
ey3=mov3*esp-0.1
mov3=mov3+0.045
if ey3>500 then tuka=tuka+1:gosub *game3
put@(ex3,ey3),ene,pset
gosub *et3

*ene4
ex4=sin(mov4)*haba4+iti4
ey4=mov4*esp+0.5
mov4=mov4+0.046
if ey4>500 then tuka=tuka+1:gosub *game4
put@(ex4,ey4),ene,pset
gosub *et4

IF KeyState(28) and x<630 THEN x=x+sp
IF KeySTATE(29) and x>0 THEN x=x-sp
IF KeySTATE(31) and y<400 THEN y=y+sp
IF KeySTATE(30) and y>100 THEN y=y-sp
if keystate(asc(" ")) or han=1 then gosub *hassha
if tx>ex and tx<ex+50 and ty>ey and ty<ey+50 then han=0:mov=-5:bomx=tx:bomy=ty:thread *bom:ty=1000:funsai=funsai+1:sleep 10:cls 3:gosub *game :goto *1
if tx>ex2 and tx<ex2+50 and ty>ey2 and ty<ey2+50 then han=0:mov2=-5:bomx=tx:bomy=ty:thread *bom:funsai=funsai+1:ty=1000:sleep 10:cls 3:gosub *game2:goto *1
if tx>ex3 and tx<ex3+50 and ty>ey3 and ty<ey3+50 then han=0:mov3=-5:bomx=tx:bomy=ty:thread *bom:funsai=funsai+1:ty=1000:sleep 10:cls 3:gosub *game3 :goto *1
if tx>ex4 and tx<ex4+50 and ty>ey4 and ty<ey4+50 then han=0:mov4=-5:bomx=tx:bomy=ty:thread *bom:funsai=funsai+1:ty=1000:sleep 10:cls 3:gosub *game4 :goto *1
locate 0,0:print "HP";20-damage
if damage=20 then goto *gameover
put@ (x,y),jiki,pset
if tuka+funsai>49 then goto *end
goto *1
*hassha:'SPACEキーが押されたときの処理
if han=0 then ty=y-15:tx=x+20:han=1 else ty=ty-spt
if ty<-15 then han=0:cls 3
put@(tx,ty),tama,pset
return 
'難易度設定
*level
input "            難易度は?(易しい 1←――→5 難しい)   ",lev
print "   " : if lev<1 or lev>5 then print "            難易度は1から5にしてください｡":sleep 500:goto *level
sp=5
spt=21-2*3
esp=20+lev*5
return 
*end
locate 15,15
print "終了｡"
locate 1,17
print "   撃墜数:";funsai;"   逃がした数:";tuka;"  撃墜率:";funsai/50*100;"％"
input "     Enterキーを押してください。",enter
end
*et
if es=0 then etx=ex+20:ety=ey+50:es=1:etys=ety
if es=1 then put@(etx,ety),ent,pset:ety=ety+7.5
if ety>etys+550 then es=0
if etx+1>x and etx+9<x+50 and ety+28>y and ety+4<y+25 then :bomx=x:bomy=y:thread *bom:damage=damage+1:cls 3:es=0
return
*et2
if es2=0 then etx2=ex2+20:ety2=ey2+50:es2=1:etys2=ety2
if es2=1 then put@(etx2,ety2),ent,pset:ety2=ety2+8
if ety2>etys2+590 then es2=0
if etx2+1>x and etx2+9<x+50 and ety2+28>y and ety2+4<y+25 then :bomx=x:bomy=y:thread *bom:damage=damage+1:cls 3:es2=0
return
*et3
if es3=0 then etx3=ex3+20:ety3=ey3+50:es3=1:etys3=ety3
if es3=1 then put@(etx3,ety3),ent,pset:ety3=ety3+6.5
if ety3>etys3+550 then es3=0
if etx3+1>x and etx3+9<x+50 and ety3+28>y and ety3+4<y+25 then :bomx=x:bomy=y:thread *bom:damage=damage+1:cls 3:es3=0
return
*et4
if es4=0 then etx4=ex4+20:ety4=ey4+50:es4=1:etys4=ety4
if es4=1 then put@(etx4,ety4),ent,pset:ety4=ety4+7
if ety4>etys4+570 then es4=0
if etx4+1>x and etx4+9<x+50 and ety4+28>y and ety4+4<y+25 then :bomx=x:bomy=y:thread *bom:damage=damage+1:cls 3:es4=0
return
*gameover
textout 10,100,"GAME OVER" ,0,2,100,50
locate 1,17
print "   撃墜数:";funsai;"   逃がした数:";tuka;"  撃墜率:";funsai/50*100;"％"
input "     Enterキーを押してください。",enter
end
*mkth
thread *bom
return 
*bom
for i=-20 to 50 step 2
circle(bomx,bomy),i,2
next i
cls 2
end 2

