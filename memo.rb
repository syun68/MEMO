#csvライブラリ(標準ライブラリ)の読み込み
require "csv"

#選択肢の表示
puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i


#メモを表示
def show(file)
  s = CSV.open("#{file}.csv")
  puts s.read
end


#条件分岐
case memo_type
when 1
    puts "拡張子を除いたファイルを入力してください"
    file_name = gets.chomp
    if file_name
    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl + Dをおします"
    file_content = STDIN.read
      CSV.open("#{file_name}.csv", "w") do |csv|
        csv.puts [file_content]
      end
    puts ""
    puts "次のようにメモを作成しました"
    show(file_name)
    end

when 2
    begin
      puts "編集したいファイル名を拡張子を除いて入力してください"
      file_name = gets.chomp
      puts "このメモを編集します"
      show(file_name)
      puts "編集したい内容を入力してください"
      puts "完了したらCtrl + Dをおします"
      file_content = STDIN.read
        CSV.open("#{file_name}.csv","w") do |csv|
          csv.puts [file_content]
        end
      puts ""
      puts "次のようにメモを編集しました"
      show(file_name)
    rescue
      puts $!
      puts $@
      puts "入力内容に誤りがあります"
    end

else
    puts "1または2を選択してください"
end
