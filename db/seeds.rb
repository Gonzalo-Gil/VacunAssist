# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vacuna.destroy_all

gripe = Vacuna.find_or_create_by(enfermedad: "Gripe", cant_dosis: 1);
fiebre_amarilla = Vacuna.find_or_create_by(enfermedad: "Fiebre amarilla", cant_dosis: 1);
sputnik = Vacuna.find_or_create_by(enfermedad: "COVID", cant_dosis: 2, laboratorio: "Sputnik");
astrazeneca = Vacuna.find_or_create_by(enfermedad: "COVID", cant_dosis: 2, laboratorio: "Astrazeneca");
sinopharm = Vacuna.find_or_create_by(enfermedad: "COVID", cant_dosis: 2, laboratorio: "Sinopharm");
moderna = Vacuna.find_or_create_by(enfermedad: "COVID", cant_dosis: 2, laboratorio: "Moderna");
