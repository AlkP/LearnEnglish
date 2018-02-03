
user1 = User.create!(phone: '79781234567', role: 1, gender: 0, password: '123456', password_confirmation: '123456',
             telegram_id: 123456789, username: 'alkpas', first_name: 'Alexey', last_name: 'Pasenko')

user2 = User.create!(phone: '79781234568', role: 0, gender: 0, password: '123456', password_confirmation: '123456',
             telegram_id: 123456782, username: 'Tanya')

user3 = User.create!(phone: '79781234561', role: 0, gender: 0, password: '123456', password_confirmation: '123456',
             telegram_id: 123456788, username: 'Vova')

Family.create!(parent_id: user1.id, child_id: user3.id)
Family.create!(parent_id: user2.id, child_id: user3.id)