usuarios = [
  {
    username: 'usuario1',
    password: 'contraseña1',
    email: 'usuario1@example.com',
    first_name: 'Juan',
    last_name: 'Gómez'
  },
  {
    username: 'usuario2',
    password: 'contraseña2',
    email: 'usuario2@example.com',
    first_name: 'María',
    last_name: 'Rodríguez'
  },
  {
    username: 'usuario3',
    password: 'contraseña3',
    email: 'usuario3@example.com',
    first_name: 'Carlos',
    last_name: 'López'
  },
  {
    username: 'usuario4',
    password: 'contraseña4',
    email: 'usuario4@example.com',
    first_name: 'Ana',
    last_name: 'Martínez'
  },
  {
    username: 'usuario5',
    password: 'contraseña5',
    email: 'usuario5@example.com',
    first_name: 'Pedro',
    last_name: 'Sánchez'
  },
  {
    username: 'anonimo',
    password: 'anonimo',
    email: 'anonimo@example.com',
    first_name: 'Usuario',
    last_name: 'Anónimo'
  },
]

usuarios.each { |user| User.create!(user) }

roles = [
  {
    name: 'TECHNICIAN'
  },
  {
    name: 'CUSTODIAN'
  },
  {
    name: 'STUDENT'
  },
  {
    name: 'ADMIN'
  },
  {
    name: 'GUESS'
  }
]

roles.each { |role| Role.create!(role) }

user_roles = [
  {
    user_id: 1,
    role_id: 1
  },
  {
    user_id: 2,
    role_id: 2
  },
  {
    user_id: 3,
    role_id: 3
  },
  {
    user_id: 4,
    role_id: 3
  },
  {
    user_id: 5,
    role_id: 4
  },
  {
    user_id: 6,
    role_id: 5
  }
]

user_roles.each { |assignment| Assignment.create!(assignment) }

laboratories = [
  {
    name: 'Laboratorio de redes',
    description: 'Laboratorio en el piso 2',
    building_number: 1
  },
  {
    name: 'Laboratorio de redes 2',
    description: 'Laboratorio en el piso 3',
    building_number: 2
  },
  {
    name: 'Laboratorio de mecanica',
    description: 'Laboratorio en el piso 2',
    building_number: 1
  }
]

laboratories.each { |laboratory| Laboratory.create!(laboratory) }
