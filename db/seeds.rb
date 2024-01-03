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
  }
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
    role_id: 3
  }
]

user_roles.each { |assignment| Assignment.create!(assignment) }

laboratories = [
  {
    name: 'Laboratorio de redes',
    description: 'Laboratorio en el piso 2'
  },
  {
    name: 'Laboratorio de redes 2',
    description: 'Laboratorio en el piso 3'
  },
  {
    name: 'Laboratorio de mecanica',
    description: 'Laboratorio en el piso 2'
  }
]

laboratories.each { |laboratory| Laboratory.create!(laboratory) }

assets = [
  {
    name: 'High Precision Microscope',
    description: 'Advanced optical microscope with enhanced precision for detailed analysis.',
    stock: true,
    amount: 2,
    custodian: User.find(2),
    laboratory_id: 1
  },
  {
    name: 'Chemical Analyzer',
    description: 'Automated analyzer for chemical composition testing, suitable for diverse samples.',
    stock: false,
    amount: 1,
    custodian: User.find(2),
    laboratory_id: 1
  },
  {
    name: 'Portable Spectrometer',
    description: 'Handheld device for on-site spectral analysis, equipped with Bluetooth connectivity.',
    stock: true,
    amount: 5,
    custodian: User.find(3),
    laboratory_id: 2
  },
  {
    name: 'Centrifuge Machine',
    description: 'High-speed centrifuge for molecular and cellular studies, with variable speed settings.',
    stock: false,
    amount: 3,
    custodian: User.find(4),
    laboratory_id: 3
  }
]

assets.each { |asset| Asset.create!(asset) }
