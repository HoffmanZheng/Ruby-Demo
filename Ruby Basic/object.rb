# 数组可以保存不同类型的对象
array1 = ["小林", "29", "Hoffman", "13.14", "Batman"]  
array1.each do |n|
    puts(n)
end

# 散列 {}
address = {:name => "Shanghai", :postal => "200233", :district => "pudong"}
p address
address[:name] = "MyLocation"  # 更新散列值
address.each do |k, v|
    print k, " : ", v, "\n"
end

# 符号 轻量级字符串，像散列的键那样只是判断是否相等的逻辑，使用符号比字符串更有效率
sym = :foo
sym2 = :"foo"
p sym, sym2
p sym.to_s, sym2.to_s   # 对符号使用 to_s 来转换成字符串

# 正则 /模式/ =~ 要匹配的字符串，匹配成功返回位置，失败返回 nil
# /模式/i 表示不区分大小写
/ruby/ =~ "start to learn Ruby"
array1.each do |item|
    if /man/i =~ item then 
        puts "reg match success: ", item
    end
end 





