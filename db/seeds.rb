
user1 = User.create!(phone: '79781234567', role: 1, gender: 0, password: '123456', password_confirmation: '123456',
             telegram_id: 123456789, username: 'alkpas', first_name: 'Alexey', last_name: 'Pasenko')

user2 = User.create!(phone: '79781234568', role: 0, gender: 0, password: '123456', password_confirmation: '123456',
             telegram_id: 123456782, username: 'Tanya')

user3 = User.create!(phone: '79781234561', role: 0, gender: 0, password: '123456', password_confirmation: '123456',
             telegram_id: 123456788, username: 'Vova')

Family.create!(parent_id: user1.id, child_id: user3.id)
Family.create!(parent_id: user2.id, child_id: user3.id)

Dictionary.create!(language: 0, category: 0, word: 'привет', translate: 'hi')
Dictionary.create!(language: 0, category: 0, word: 'здравствуйте, привет', translate: 'hello')
Dictionary.create!(language: 0, category: 0, word: 'извини(те)', translate: 'sorry')
Dictionary.create!(language: 0, category: 0, word: 'пожалуйста(прошу); угождать', translate: 'please')
Dictionary.create!(language: 0, category: 0, word: 'спасибо', translate: 'thank you')
Dictionary.create!(language: 0, category: 0, word: 'пожалуйста, не за что', translate: 'you are welcome')
Dictionary.create!(language: 0, category: 0, word: 'как жаль', translate: 'what a pity')
Dictionary.create!(language: 0, category: 0, word: 'до свидания', translate: 'good bye')

Dictionary.create!(language: 0, category: 1, word: 'люди', translate: 'people')
Dictionary.create!(language: 0, category: 1, word: 'мужчина', translate: 'man')
Dictionary.create!(language: 0, category: 1, word: 'женщина', translate: 'woman')
Dictionary.create!(language: 0, category: 1, word: 'ребенок', translate: 'child')
Dictionary.create!(language: 0, category: 1, word: 'мальчик', translate: 'boy')
Dictionary.create!(language: 0, category: 1, word: 'девочка', translate: 'girl')
Dictionary.create!(language: 0, category: 1, word: 'парень', translate: 'guy')
Dictionary.create!(language: 0, category: 1, word: 'друг', translate: 'friend')
Dictionary.create!(language: 0, category: 1, word: 'знакомый; знакомство', translate: 'acquaintance')
Dictionary.create!(language: 0, category: 1, word: 'сосед', translate: 'neighbor')
Dictionary.create!(language: 0, category: 1, word: 'гость', translate: 'guest')
Dictionary.create!(language: 0, category: 1, word: 'начальник; шеф; главный; вождь', translate: 'chief')
Dictionary.create!(language: 0, category: 1, word: 'босс', translate: 'boss')
Dictionary.create!(language: 0, category: 1, word: 'конкурент; соперник', translate: 'competitor')
Dictionary.create!(language: 0, category: 1, word: 'клиент', translate: 'client')
Dictionary.create!(language: 0, category: 1, word: 'коллега', translate: 'colleague')