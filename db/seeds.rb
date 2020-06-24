Allocation.delete_all
Demand.delete_all
Product.delete_all
User.delete_all
User.create(
  [
    {email: 'jaferrada@uc.cl', first_name: 'Javiera', last_name: 'Ferrada', password: 123456, password_confirmation: 123456, type_of_user: 'Fabricante'},
    {email: 'egromero@uc.cl', first_name: 'Erick', last_name: 'Romero', password: 123456, password_confirmation: 123456, type_of_user: 'Benefactor'},
    {email: 'ifcarrera@uc.cl', first_name: 'Hospital Sotero del Rio', last_name: 'Pediatria', password: 123456, password_confirmation: 123456, type_of_user: 'Hospital'},
    {email: 'admin@uc.cl', first_name: 'Admin', last_name: '', password: 123456, password_confirmation: 123456, type_of_user: 'Administrador'}
  ]
)

p1 = Product.create(name: 'Mascarilla')
p1.image.attach(io: File.open(File.join(Rails.public_path, 'mascarilla.jpeg')), filename: 'mascarilla.jpeg')
p1.save()
p2 = Product.create(name: 'Ventilador mecánico')
p2.image.attach(io: File.open(File.join(Rails.public_path, 'ventilador.png')), filename: 'ventilador.png')
p2.save()
#User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?