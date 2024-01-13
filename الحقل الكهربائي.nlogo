breed [anodreds anodred]

breed [cathodblues cathodblue]

globals [d work Elec numqcode]


to setup
  clear-all
  reset-ticks
  set d dist
  set work 0
  set Elec ( VA - VB ) / d
set numqcode numq
  crt-cathod
  crt-anod
  create-setup-line
  setup-patch
 crt-q

end
to crt-q
  let j -5
  repeat numq[
    set j j + 2
  create-turtles 1 [
    set size 2
    setxy -8 j
    set shape "q+"

    if dist >= 8  and dist <= 10 [
      set xcor -8
    ]
    if dist >= 6  and dist < 8 [
      set xcor -7
    ]
    if dist >= 4  and dist < 6 [
      set xcor -6
    ]
    if  dist < 4 [
      set xcor -5
    ]


  ]]


end
to move-charges
  set d dist
   set Elec ( VA - VB ) / d
  if numqcode != numq [
  ask turtles with [shape = "q+"]
  [
  die

  ]
  crt-q
 set numqcode numq
  ]
  ask turtles with [label = "."]
  [

  die

  ]

create-setup-line

  ask cathodblues  [

    if dist >= 8  and dist <= 10 [
      set xcor 12.5
    ]
    if dist >= 6  and dist < 8 [
      set xcor 10
    ]
    if dist >= 4  and dist < 6 [
      set xcor 9
    ]
    if  dist < 4 [
      set xcor 8
    ]
  ]
  ask anodreds  [

    if dist >= 8  and dist <= 10 [
       set xcor -11.5
    ]
    if dist >= 6  and dist < 8 [
      set xcor -10
    ]
    if dist >= 4  and dist < 6 [
      set xcor -9
    ]
    if  dist < 4 [
      set xcor -8
    ]
  ]

  ask turtles with [shape = "q+"]
  [

    if xcor < 10 [
      set xcor xcor + force
    ]
    set work force * d
    wait 0.4


   ifelse dist >= 8  and dist <= 10 [

      if xcor >= 10 [
      set xcor -10
      ]

    ]
    [
      ifelse dist >= 6  and dist < 8  and xcor >= 8 [

        set xcor -7

      ]
      [
            ifelse dist >= 4  and dist < 6  and xcor >= 6 [
              set xcor -6
            ]

            [
               ifelse  dist < 4  and xcor >= 4[
                 set xcor -5
                  ]
                  []
            ]
      ]
    ]
  ]
  wait waittime
  tick
end
to create-setup-line
  create-turtles 1 [
    set label "."
    set shape "arrow3"
     if dist >= 8 [
        set size 17
      ]
      if dist < 8 and dist >= 6 [
        set size 12
      ]
      if dist < 6 and dist >= 4 [
        set size 9
      ]
      if dist < 4 and dist >= 1 [
        set size 7
      ]
    setxy 0 10
  ]
  let i -5

  repeat Elec - 1 [
    ifelse Elec <= 50 [set i  i + 1][
      set i  i + 0.2]
    create-turtles 1 [

      setxy 0 i
      set shape "line"
      set label "."
      if dist >= 8 [
        set size 17.5
        set xcor xcor - 0.3
      ]
      if dist < 8 and dist >= 6 [
        set size 13.7
        set xcor xcor - 0.5
      ]
      if dist < 6 and dist >= 4 [
        set size 11.7
        set xcor xcor - 0.5
      ]
      if dist < 4 and dist >= 1 [
        set size 10
        set xcor xcor - 0.5
      ]

    ]
  ]
end


to setup-patch
  ask patches [
    set pcolor white
  ]
end

to crt-cathod

  create-cathodblues 1 [
    set size 25

    set ycor 0
    set shape "cathod"

    if dist >= 8  and dist <= 10 [
      set xcor 12.5
    ]
    if dist >= 6  and dist < 8 [
      set xcor 10
    ]
    if dist >= 4  and dist < 6 [
      set xcor 9
    ]
    if  dist < 4 [
      set xcor 8
    ]
  ]

end
to crt-anod
  create-anodreds 1 [
    set size 25
    set ycor 0
    set shape "anod"
    if dist >= 8  and dist <= 10 [
      set xcor -11.5
    ]
    if dist >= 6  and dist < 8 [
      set xcor -10
    ]
    if dist >= 4  and dist < 6 [
      set xcor -9
    ]
    if  dist < 4 [
      set xcor -8
    ]
  ]

end
@#$#@#$#@
GRAPHICS-WINDOW
232
11
702
482
-1
-1
14.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
1
1
1
ticks
30.0

BUTTON
3
10
104
43
تهيئة النموذج
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
110
10
212
43
تحرك الشحنة
move-charges
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
701
32
1263
240
مودل خاص بمحاكاة عملية حركة شحنة كهربائية من قطب الموجب الى القطب السالب \nويتم حساب فرق الكمون عن طريق العلاقة التالية \n Elec ( VA - VB ) / 0.008\nوإظهار النتيجة على الشاشة\n\nوحساب العمل كما في العلاقة التالية\n work force * d\nإظهار النتيجة على الشاشة\n
16
51.0
0

SLIDER
4
54
102
87
force
force
1
4
4.0
1
1
NIL
HORIZONTAL

SLIDER
6
95
100
128
waittime
waittime
0
2
0.1
0.1
1
NIL
HORIZONTAL

MONITOR
105
248
180
293
NIL
work
17
1
11

MONITOR
18
167
98
212
NIL
Elec
17
1
11

INPUTBOX
13
389
98
449
VA
260.0
1
0
Number

INPUTBOX
103
389
188
449
VB
20.0
1
0
Number

TEXTBOX
70
141
108
160
V / m
14
0.0
1

TEXTBOX
123
225
151
245
J
16
0.0
1

MONITOR
18
248
102
293
NIL
d
17
1
11

TEXTBOX
29
222
45
240
m
14
0.0
1

MONITOR
105
168
181
213
lines
count turtles with [label = \".\"]
17
1
11

SLIDER
16
324
188
357
dist
dist
1
10
1.0
3
1
NIL
HORIZONTAL

TEXTBOX
139
224
179
242
العمل
14
0.0
1

TEXTBOX
114
141
187
159
شدة الحقل
14
0.0
1

TEXTBOX
50
301
200
319
المسافة بين اللبوسين
14
0.0
1

TEXTBOX
115
56
213
74
القوة الكهربائية
14
0.0
1

TEXTBOX
117
96
211
114
سرعة النموذج
14
0.0
1

TEXTBOX
92
364
188
382
كمون اللبوسين
14
0.0
1

CHOOSER
13
450
188
495
numq
numq
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
3

@#$#@#$#@
الكود الذي قدمته يظهر نموذجًا بسيطًا لتحاكي عملية تحرك شحنتين كهربائيتين. يتم تمثيل الشحنة الإيجابية باللون الأحمر والشحنة السالبة باللون الأزرق. الكائنات مُرسومة كخطوط وأسهم لتمثيل مسار الحركة والتوجيه.

للتفصيل:

1. تم تحديد الدوال `to setup` و `to setup-patche` لإعداد البيئة الأولية، حيث يتم إنشاء خطوط وخلايا بألوان محددة لتمثيل الأجزاء الإيجابية والسالبة من المجال الكهربائي.

2. تم تعريف `to create-setup-line` لإنشاء خطوط رأسية تعبر المجال الكهربائي.

3. تم تحديد `to create-setup` لإنشاء الشحنات الإيجابية والسالبة في المواقع المناسبة.

4. تم تعريف `to move-charges` لتحريك الشحنة الإيجابية نحو الشحنة السالبة أو العكس، مع حساب بعض القيم الفيزيائية مثل العمل والفرق في الجهد.

5. تم استخدام `ask turtles` للتحكم في حركة السلاحف وتحديث الحالة والتوقيت بواسطة `tick`.

الكود يُظهر فهماً جيداً لمفاهيم الفيزياء الكهربائية ويقوم بتحليل بيئة مكونة من شحنتين. يُفضل إضافة تعليقات إضافية لتوضيح بعض الخطوات والمفاهيم.


مودل خاص بمحاكاة عملية حركة شحنة كهربائية من قطب الموجب الى القطب السالب 
ويتم حساب فرق الكمون عن طريق العلاقة التالية 
 Elec ( VA - VB ) / 0.008
وإظهار النتيجة على الشاشة

وحساب العمل كما في العلاقة التالية
 work force * d
إظهار النتيجة على الشاشة
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

+
false
0
Rectangle -16777216 true false 135 0 165 300
Rectangle -16777216 true false 0 135 300 165

-
false
0
Rectangle -16777216 true false 0 135 300 180

a
false
0
Polygon -16777216 true false 60 255 90 255 150 60 120 60 60 255
Polygon -16777216 true false 120 60 210 255 240 255 150 60
Rectangle -16777216 true false 105 165 180 180

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

anod
false
0
Rectangle -2674135 true false 90 -60 180 360
Rectangle -16777216 true false 120 15 165 30
Rectangle -16777216 true false 135 0 150 45
Rectangle -16777216 true false 120 270 165 285
Rectangle -16777216 true false 120 210 165 225
Rectangle -16777216 true false 120 150 165 165
Rectangle -16777216 true false 120 75 165 90
Rectangle -16777216 true false 135 255 150 300
Rectangle -16777216 true false 135 195 150 240
Rectangle -16777216 true false 135 135 150 180
Rectangle -16777216 true false 135 60 150 105

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

arrow3
false
0
Polygon -16777216 true false -180 150 120 150 90 135 90 165 120 150
Line -16777216 false 0 150 90 150
Rectangle -16777216 true false 135 105 180 120
Rectangle -16777216 true false 135 105 150 180
Rectangle -16777216 true false 135 165 180 180
Rectangle -16777216 true false 135 135 180 150
Rectangle -16777216 true false 120 60 195 75
Polygon -16777216 true false 180 45 225 60 180 90 180 45
Line -16777216 false 300 150 195 150

b
false
0
Polygon -16777216 true false 90 30 90 270 195 270 195 180 90 165 195 150 195 45 90 30
Polygon -7500403 false true 180 120
Rectangle -1 true false 120 60 180 135
Rectangle -1 true false 120 195 180 240

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

cathod
false
0
Rectangle -13345367 true false 105 -75 195 495
Rectangle -16777216 true false 120 30 165 45
Rectangle -16777216 true false 120 270 165 285
Rectangle -16777216 true false 120 210 165 225
Rectangle -16777216 true false 120 150 165 165
Rectangle -16777216 true false 120 90 165 105

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

d
false
0
Circle -16777216 true false 101 86 67
Line -16777216 false 0 150 300 150
Circle -1 true false 120 105 30
Rectangle -16777216 true false 150 60 165 105

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
false
0
Line -16777216 false 0 150 300 150

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

q+
true
0
Circle -16777216 false false 0 0 300
Circle -1 true false 0 0 300
Rectangle -16777216 true false 120 60 180 240
Rectangle -16777216 true false 60 120 240 180

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.3.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
