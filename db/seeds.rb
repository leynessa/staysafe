# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
puts "cleaning database"
Incident.destroy_all
puts "Creating incidents..."

group_robbery = {title: "Group Robbery ", incident_type: "robbery", description: " 2 persom involved ", time: "19:30", date: "", longitude: "-43.196388", latitude: "-22.908333", address: "Rua Lauro Müller 116,  Botafogo, Rio de Janeiro ", key: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_tf5PoJVB4WFUiTak-lSj2ShZullkKt1knQ&usqp=CAU"}
shoot_out ={title: "Shoot Out", incident_type: "shooting", description: " 2 police men and two men involved", time: "20:30", date: "", longitude: "-43.1837295", latitude: "-22.9694962", address: "Praça Serzedelo Correia 27, Copacabana", key: "https://images.unsplash.com/photo-1574665058964-6305c8a9c273?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBvbGljaWF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"}
hold_up ={title: "Hold Up at gun point", incident_type: "robbery", description: "  1  man and a women", time: "15:30", date:"", longitude: "-43.2063632", latitude: "-22.9702599", address: "Avenida Epitácio Pessoa 1674, Lagoa, Rio de Janeiro", key: "https://media.istockphoto.com/photos/armed-robbery-picture-id546009746?b=1&k=20&m=546009746&s=170667a&w=0&h=8gm4j47QOL_RS6Q0cLH-ilmhsY7BftmuEj1j5IoYX6s="}
police_operation ={title: "Police Operation ", incident_type: "shooting", description: " many police men and many men inlovoed", time: "08:40", date: "", longitude: "-43,279977", latitude: "-22,842306", address: "Rua Plínio de Oliveira, 253, Penha, Rio de Janeiro", key: "https://images.unsplash.com/photo-1544993570-05e1f210815a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cG9saWNlJTIwb3BlcmF0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"}
theft = {title: " theft", incident_type: "robbery", description: " two men involved", time: "06:23", date: "", longitude: "-43.230320", latitude: "-22.912376", address: "Av. Pres. Castelo Branco, Portão 3, Maracanã, Rio de Janeiro", key: "https://media.istockphoto.com/photos/man-stealing-money-and-personal-stuff-from-woman-picture-id1279420299?b=1&k=20&m=1279420299&s=170667a&w=0&h=z1QDaNwSkbNfZEmTjUFHUQvEvezi0-1FqDwcENg46v0="}


[group_robbery, shoot_out, hold_up, police_operation, theft].each do |attributes|
  file = URI.open(attributes[:key])
  incident = Incident.new(attributes.except(:key))
  incident.photo.attach(io: file, filename: "photos.png", content_type: "image/png")

  incident.save!
  puts "Created #{incident.title}"
end
puts "Finished!"
