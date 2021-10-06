# 通过 ARGV 数组读取命令参数
puts "first param: #{ARGV[0]}"
puts "second param: #{ARGV[1]}"

# 读取文件
fileName = "LICENSE.txt"
file = File.open(fileName)
text = file.read
print text
file.close
puts "---------------------------"

# 逐行读取
file = File.open(fileName)
i = 0
file.each_line do |line|
    i = i + 1
    print i.to_s, " :",  line
end
file.close
puts "---------------------------"

# 对文件中的内容进行正则匹配，满足匹配的才打印
file = File.open(fileName)
pattern = Regexp.new(ARGV[2])
p pattern
file.each_line do |line|
    if pattern =~ line then
        puts "pattern matched: " + line
    end
end
puts "---------------------------"

# pp pretty print
