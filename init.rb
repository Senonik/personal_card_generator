require_relative "personal_card"

puts "Введите данные для заполнения визитной карточки"
personal_card = PersonalCard.new
personal_card.create_html_doc