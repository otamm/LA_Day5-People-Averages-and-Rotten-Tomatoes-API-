people = [
  { name: "George Michael Bluth", age: 18, eye_color: "brown", hometown: "Newport Beach" },
  { name: "Lindsay Bluth Funke",  age: 36, eye_color: "blue",  hometown: "Newport Beach" },
  { name: "Lucille Bluth",        age: 65, eye_color: "brown", hometown: "Newport Beach" },
  { name: "Maeby Funke",          age: 17, eye_color: "green", hometown: "Boston" },
  { name: "GOB Bluth",            age: 38, eye_color: "brown", hometown: "Newport Beach" },
  { name: "Tobias Funke",         age: 43, eye_color: "brown", hometown: "Boston" }
]
#age
people_statistics={
  :gender => {male: 0, female: 0},
  :eye_color => {blue: 0, green:0, brown:0},
  :hometown => {boston:0 ,newport_b:0},
  :age => {below_20: 0 , over_20:0}
}

#eye color

#hometown

for i in (0..people.size - 1)
  if people[i][:age] > 20
    people_statistics[:age][:over_20] +=1
  end
  if people[i][:age] <= 20
    people_statistics[:age][:below_20]+=1
  end
  if people[i][:hometown] == "Newport Beach"
    people_statistics[:hometown][:newport_b]+=1
  end
  if people[i][:hometown] == "Boston"
    people_statistics[:hometown][:boston]+=1
  end
  if people[i][:eye_color] == "brown"
    people_statistics[:eye_color][:brown]+=1
  end
  if people[i][:eye_color] == "blue"
    people_statistics[:eye_color][:blue]+=1
  end
  if people[i][:eye_color] == "green"
    people_statistics[:eye_color][:green]+=1
  end
end
puts "People statistics:"
puts "Age:"
puts "Below than or equal to 20yr: #{people_statistics[:age][:below_20]} ; over twenty: #{people_statistics[:age][:over_20]}"
puts "Hometown:"
puts "People from Boston: #{people_statistics[:hometown][:boston]} ; people from Newport Beach: #{people_statistics[:hometown][:newport_b]}"
puts "Eye color:"
puts "#{people_statistics[:eye_color][:brown]} brown-eyed, #{people_statistics[:eye_color][:blue]} blue-eyed, #{people_statistics[:eye_color][:green]} green-eyed."
