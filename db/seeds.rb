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
Vacuna.destroy_all

sputnik = Laboratorio.create_or_find_by(nombre: "Sputnik")
astra =Laboratorio.create_or_find_by(nombre: "Astrazeneca")
moderna= Laboratorio.create_or_find_by(nombre: "Moderna")
sino = Laboratorio.create_or_find_by(nombre: "Sinopharm")
labGripe = Laboratorio.create_or_find_by(nombre: "Laboratorio de vacuna contra gripe")
labFiebre = Laboratorio.create_or_find_by(nombre: "Laboratorio de vacuna contra Fiebre Amarilla")

eGripe = Enfermedad.create_or_find_by(nombre: "Gripe")
eFiebre = Enfermedad.create_or_find_by(nombre: "Fiebre amarilla")
eCovid = Enfermedad.create_or_find_by(nombre: "COVID")

sede1 = Sede.create_or_find_by(nombre: "Sede 1", calle: 1, numero: 123)
sede2 = Sede.create_or_find_by(nombre: "Sede 2", calle: 2, numero: 456)
sede3 = Sede.create_or_find_by(nombre: "Sede 3", calle: 3, numero: 789)

vGripe= Vacuna.create_or_find_by(enfermedad: eGripe, cant_dosis: 1, laboratorio: labGripe, nombre: "Vacuna contra la Gripe")
vFiebre= Vacuna.create_or_find_by(enfermedad: eFiebre, cant_dosis: 1, laboratorio: labFiebre, nombre: "Vacuna contra la Fiebre Amarilla")
vCovidSino= Vacuna.create_or_find_by(enfermedad: eCovid, cant_dosis: 2, laboratorio: sino, nombre: "Sinopharm")
vCovidAstra= Vacuna.create_or_find_by(enfermedad: eCovid, cant_dosis: 2, laboratorio: astra, nombre: "AstraZeneca")
vCovidSputnik= Vacuna.create_or_find_by(enfermedad: eCovid, cant_dosis: 2, laboratorio: sputnik, nombre: "Sputnik")
vCovidModerna= Vacuna.create_or_find_by(enfermedad: eCovid, cant_dosis: 2, laboratorio: moderna, nombre: "Moderna")


Turno.create_or_find_by(fecha: Date.new(2021,06,17), sede: sede1, vacuna: vCovidSino, user_id: 1, estado: 2, enfermedad: eCovid)
Turno.create_or_find_by(fecha: Date.new(2021,04,04), sede: sede2, vacuna: vFiebre, user_id: 1, estado: 2, enfermedad: eFiebre)

