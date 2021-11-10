def get_name
  begin
    puts "Фамилию, Имя и Отчество:"
    name = STDIN.gets.chomp
  end until name =~ /\A(?=\A.{,100}\z) *[a-zа-яё]+ +[a-zа-яё]+ +[a-zа-яё]+ *\z/i
# выполняетя проверка регулярным выражением, что данные пользователя не более
# 100 знаков и состоят из 3-х групп, лишние пробелы допускаются

  name = name.scan(/[a-zа-яё]+/).map(&:capitalize).join" "
# из введенной строки удаляются пробелы, форматируется регистр
end
get_name

def get_description
begin
    puts "Опишите деятельность человека"
    description = STDIN.gets.chomp
  end while name =~ /<.+>/
# regexp проверяет на наличие вредоносного кода в описании
description[0] = description[0].upcase

end
