# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   bundle exec rails db:drop db:create db:migrate db:seed
#   bundle exec rails c

Movie.create(title: 'title', length: 'PT20S', director: 'director', genre: 'genre')
CinemaHall.create(name: 1, size: 200, column_num: 20, row_num: 10)
Screening.create(movie_id: 1, cinema_hall_id: 1, screen_time: '2021-08-25 11:25:06')
Seat.create(name: 'name', cinema_hall_id: 1)
Ticket.create(ticket_type: 'type', price: 10.99, screening_id: 1, seat_id: 1, reservation_id: 1)
Reservation.create(status: 'status', screening_id: 1, user_id: 1)
User.create(email: 'email@email.com', password: 'password', password_confirmation: 'password', role: 'role',
            nickname: 'nickname', first_name: 'first_name', last_name: 'last_name')
