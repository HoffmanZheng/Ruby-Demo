#encoding:UTF-8
=begin
多行注释
可以在首行代码添加注释来指定文件的编码格式
=end
print("hello Ruby! \n")
puts "hello", "Ruby", "!"  # 逐行打印  相当于 println
a = 100
b = "100"
p a, b  # 会根据对象类型打印，打印出来的字符串自带 "" 
print a, b
print("\n")
print("打印中文试试\n")
print("一百的字符串=#{b}\n")
puts(Math.sqrt(99))  # 调用数字运算
# 加一些东西
# ## 23213
# # 43241235@!attribute5
# 以下为控制语句
if a >= 10 then
    puts("greater!")
else 
    puts("smaller!")
end
i = 1
while i < 10 do 
    print i, "\n"
    i = i + 2
end 
5.times do # 如果清楚循环次数，可以用 times
    puts("use times if you know the circle times")
end 