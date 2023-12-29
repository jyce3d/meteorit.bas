10 SCREEN 1 : key off
15 color 15,1,1
20 mt$=chr$(128)
30 x= 15*8
40 y = 12*8
50 rem affichage des premiers météores
55 sc = 0
60 GOSUB 1000
70 for i=1 to 19 
80   for j=1 to int(RND(-time)*5)
85    k=int(RND(-time)*31)
90    locate k,i : if (NOT (i=12 and k=15)) and (NOT (i=12 and k=16) ) THEN  print mt$
100  next j
110 next i 
120 rem boucle du jeu
125 put sprite 0,(x,y),8
130 if stick(0)=3 then x=x+4 : if x>=31*8 then x=31*8
140 if stick(0)=7 then x=x-4 : if x<8 then x=8
150 rem tester collision
155 rem vpoke 6144+int(y/8)*32+int(x/8), 65
160 if vpeek (6144+int(y/8)*32+int(x/8)) <> 32 then goto 2000
200 rem ajouter une ligne utilisation d'un bug
210 for j=1 to int(RND(-time)*5)
220  k=int(RND(-time)*31)
230  locate k,22 : print mt$
240 next j
241 locate 1,1 : PRINT "                       "
245 locate 1,24 : print " "
246 sc = sc +1 : locate 1,1 : PRINT "SCORE:" + str$(sc)
250 goto 120
800 END
1000 rem definition des sprites
1010 a$=""
1020 for j=1 to 8
1030 read b$ : a$=a$+chr$(val("&b"+b$))
1040 NEXT j
1050 sprite$(0)=a$
1060 data "11111111"
1070 data "11111111"
1080 data "10111101"
1090 data "10111101"
1100 data "10111101"
1110 data "10011001"
1120 data "00011000"
1130 data "00011000"
1300 rem definition des caracteres
1310 rem début de la table des char = 1024 (screen 1 sinon 3072 pour 0)
1320 rem correspond chr$(128)
1330 rem alors 2048+97*8
1340 for i = 1024 to 1031 
1350 read b$ : vpoke i, val("&b"+b$)
1360 next i
1370 data "00111110"
1380 data "01011111"
1390 data "11001101"
1400 data "11111100"
1410 data "11111001"
1420 data "01111010"
1430 data "01011110"
1450 data "01101100"
1460 return 
2000 locate 10,10 : Print "Game OVER!"

