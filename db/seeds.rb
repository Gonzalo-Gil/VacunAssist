# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sede.destroy_all
Laboratorio.destroy_all
Enfermedad.destroy_all
Turno.destroy_all

sputnik = Laboratorio.create_or_find_by(nombre: "Sputnik")
astra =Laboratorio.create_or_find_by(nombre: "Astrazeneca")
moderna= Laboratorio.create_or_find_by(nombre: "Moderna")
sino = Laboratorio.create_or_find_by(nombre: "Sinopharm")

eGripe = Enfermedad.create_or_find_by(nombre: "Gripe")
eFiebre = Enfermedad.create_or_find_by(nombre: "Fiebre amarilla")
eCovid = Enfermedad.create_or_find_by(nombre: "COVID-19")

sede1 = Sede.create_or_find_by(nombre: "Sede 1")
sede2 = Sede.create_or_find_by(nombre: "Sede 2")
sede3 = Sede.create_or_find_by(nombre: "Sede 3")

vGripe= Vacuna.create_or_find_by(enfermedad: eGripe, cant_dosis: 1, laboratorio: astra)
vFiebre= Vacuna.create_or_find_by(enfermedad: eFiebre, cant_dosis: 1, laboratorio: sputnik)
vCovid= Vacuna.create_or_find_by(enfermedad: eCovid, cant_dosis: 2, laboratorio: sino)

Turno.create_or_find_by(fecha: 17/06/2021, sede: sede1, vacuna: vGripe, user_id: 1, estado: 2)
Turno.create_or_find_by(fecha: 9/02/2020, sede: sede1, vacuna: vCovid, user_id: 1, estado: 2)
Turno.create_or_find_by(fecha: 3/12/2021, sede: sede1, vacuna: vGripe, user_id: 1, estado: 0)
