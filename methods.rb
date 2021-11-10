def get_image
  begin
   puts "Чтобы добавить фотографию в визитную карточку, введите ссылку на существующий файл в формате .jpg или .png"
   link = STDIN.gets.chomp
  end until File.exist?(link) && link[-4,4] =~ /\.(?:jpg|png)/
  link
end


def get_name
 begin
   puts "Фамилию, Имя и Отчество:"
   name = STDIN.gets.chomp
end until name =~ /\A(?=\A.{,100}\z) *[a-zа-яё]+ +[a-zа-яё]+ +[a-zа-яё]+ *\z/i
# выполняетя проверка регулярным выражением, что данные пользователя не более
# 100 знаков и состоят из 3-х групп, лишние пробелы допускаются

  name = name.scan(/[a-zа-яё]+/i).map(&:capitalize).join" "
# из введенной строки удаляются пробелы, форматируется регистр
end


def get_description
  begin
    puts "Опишите деятельность человека (не более 60 символов):"
    description = STDIN.gets.chomp
  end while description.size >= 60 && description =~ /<.+>/
# regexp проверяет на наличие вредоносного кода в описании и 
# на длину строки

description.strip!
# В описании не будут содержаться пробелы в начале и конце строки

description[0] = description[0].upcase
# Описание всегда будет начинаться с большой буквы
description
end


def get_phone
  begin
   puts "Введите номер телефона (только цифры):"
   print ("+7 ")
   phone = STDIN.gets.chomp
  end until phone =~ /\A\d{10}\z/
  # Проверяем, что пользователь ввел только 10 цифр телефона
  "Телефон: +7 #{phone[0,3]} #{phone[3,3]}-#{phone[6,2]}-#{phone[8,2]}"
end


def get_email
 begin
   puts "Введите адрес электронной почты:"
   print ("Email:")
   email = STDIN.gets.chomp.downcase
  end until email =~ /\A(?=\A.{,100}\z)[\w\.\-]+@[a-z\d\-]+\.[a-z]{2,}\z/
  # Проверяем, что пользователь ввел почту
  "Email: #{email}"
end