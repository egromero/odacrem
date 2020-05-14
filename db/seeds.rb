# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Demand.delete_all
Product.delete_all
User.delete_all
User.create(
  [
    {email: 'jaferrada@uc.cl', password: 123456, password_confirmation: 123456, type_of_user: 'Fabricante'}, 
    {email: 'egromero@uc.cl', password: 123456, password_confirmation: 123456, type_of_user: 'Benefactor'},
    {email: 'ifcarrera@uc.cl', first_name: 'Hospital Sotero del Rio', last_name: 'Pediatria', password: 123456, password_confirmation: 123456, type_of_user: 'Hospital'}
  ]
)

products = Product.create(
  [
    { name: 'Mascarilla', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRGVQSybv8mI-HMLx-dIOHbbe7JhlgBC5VLRh2ZhqRrHSxKkB1g&usqp=CAU' },
    { name: 'Ventilador mecánico', image: 'https://mgm.cl/wp-content/uploads/2019/01/Philips-respironics-ventilador-mecanico-trilogy-evo-1200x955.png' },
    { name: 'Guantes', image: 'https://www.farmaciatedin.es/3930-thickbox_default/guantes-nitrilo-semper-alta-calidad.jpg' },
    { name: 'Alcohol', image: 'https://www.icbfs.cl/wp-content/uploads/150000592.jpg' },
    { name: 'Alcohol gel', image: 'https://bienverde.cl/1352-thickbox_default/alcohol-gel-100-ml-winkler.jpg' },
    { name: 'Agujas para anestesia', image: 'https://www.medicorpgroup.com/tienda-en-linea/img/p/1/5/5/155-large_default.jpg' },
    { name: 'Gorro quirúrjico', image: 'https://carmenlucashn.com/wp-content/uploads/2018/04/83566-2-440x446.png' }
  ]
)

