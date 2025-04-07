class Question {
  final String text;
  final String answer;

  const Question({
    required this.text,
    required this.answer,
  });
}

final questionsList = [
  // Science
  Question(text: "What is the chemical symbol for gold?", answer: "Au"),
  Question(text: "What planet is known as the Red Planet?", answer: "Mars"),
  Question(text: "What is the largest organ in the human body?", answer: "Skin"),
  Question(text: "What is the speed of light in miles per second?", answer: "186,282"),
  Question(text: "What is the atomic number of carbon?", answer: "6"),
  Question(text: "What is the hardest natural substance on Earth?", answer: "Diamond"),
  Question(text: "What is the chemical formula for water?", answer: "H2O"),
  Question(text: "What is the closest star to Earth?", answer: "Sun"),
  Question(text: "What is the largest planet in our solar system?", answer: "Jupiter"),
  Question(text: "What is the chemical symbol for silver?", answer: "Ag"),
  
  // History
  Question(text: "Who was the first President of the United States?", answer: "George Washington"),
  Question(text: "In which year did World War II end?", answer: "1945"),
  Question(text: "Who painted the Mona Lisa?", answer: "Leonardo da Vinci"),
  Question(text: "What was the first civilization to use writing?", answer: "Sumerians"),
  Question(text: "Who was the first man to walk on the moon?", answer: "Neil Armstrong"),
  Question(text: "In which year did the Titanic sink?", answer: "1912"),
  Question(text: "Who was the first woman to win a Nobel Prize?", answer: "Marie Curie"),
  Question(text: "What year did the Berlin Wall fall?", answer: "1989"),
  Question(text: "Who was the first Emperor of China?", answer: "Qin Shi Huang"),
  Question(text: "In which year did Columbus discover America?", answer: "1492"),
  
  // Geography
  Question(text: "What is the capital of Japan?", answer: "Tokyo"),
  Question(text: "What is the largest desert in the world?", answer: "Sahara"),
  Question(text: "What is the longest river in the world?", answer: "Nile"),
  Question(text: "What is the capital of Australia?", answer: "Canberra"),
  Question(text: "What is the smallest continent?", answer: "Australia"),
  Question(text: "What is the capital of Brazil?", answer: "Brasília"),
  Question(text: "What is the largest ocean on Earth?", answer: "Pacific"),
  Question(text: "What is the capital of Egypt?", answer: "Cairo"),
  Question(text: "What is the highest mountain in the world?", answer: "Mount Everest"),
  Question(text: "What is the capital of India?", answer: "New Delhi"),
  
  // Technology
  Question(text: "Who created the first web browser?", answer: "Tim Berners-Lee"),
  Question(text: "What does CPU stand for?", answer: "Central Processing Unit"),
  Question(text: "What year was the first iPhone released?", answer: "2007"),
  Question(text: "What does HTML stand for?", answer: "HyperText Markup Language"),
  Question(text: "Who founded Microsoft?", answer: "Bill Gates"),
  Question(text: "What does RAM stand for?", answer: "Random Access Memory"),
  Question(text: "Who created Linux?", answer: "Linus Torvalds"),
  Question(text: "What does URL stand for?", answer: "Uniform Resource Locator"),
  Question(text: "What year was the first computer mouse invented?", answer: "1964"),
  Question(text: "What does WiFi stand for?", answer: "Wireless Fidelity"),
  
  // Sports
  Question(text: "How many players are there in a basketball team on court?", answer: "5"),
  Question(text: "What is the national sport of Japan?", answer: "Sumo"),
  Question(text: "How many Olympic rings are there?", answer: "5"),
  Question(text: "What is the most popular sport in the world?", answer: "Soccer"),
  Question(text: "How many players are there in a soccer team on field?", answer: "11"),
  Question(text: "What is the national sport of Canada?", answer: "Lacrosse"),
  Question(text: "How many points is a touchdown worth in American football?", answer: "6"),
  Question(text: "What is the national sport of India?", answer: "Field Hockey"),
  Question(text: "How many players are there in a volleyball team on court?", answer: "6"),
  Question(text: "What is the national sport of Brazil?", answer: "Soccer"),
  
  // Entertainment
  Question(text: "Who played Iron Man in the Marvel Cinematic Universe?", answer: "Robert Downey Jr"),
  Question(text: "What is the name of Mario's brother in Super Mario?", answer: "Luigi"),
  Question(text: "Who wrote 'Harry Potter'?", answer: "J.K. Rowling"),
  Question(text: "What is the name of Batman's alter ego?", answer: "Bruce Wayne"),
  Question(text: "Who played Jack in Titanic?", answer: "Leonardo DiCaprio"),
  Question(text: "What is the name of Mickey Mouse's dog?", answer: "Pluto"),
  Question(text: "Who created Star Wars?", answer: "George Lucas"),
  Question(text: "What is the name of Spider-Man's alter ego?", answer: "Peter Parker"),
  Question(text: "Who played James Bond in the most films?", answer: "Roger Moore"),
  Question(text: "What is the name of Mario's arch-nemesis?", answer: "Bowser"),
  
  // Literature
  Question(text: "Who wrote 'Romeo and Juliet'?", answer: "William Shakespeare"),
  Question(text: "Who wrote 'The Great Gatsby'?", answer: "F. Scott Fitzgerald"),
  Question(text: "Who wrote 'Pride and Prejudice'?", answer: "Jane Austen"),
  Question(text: "Who wrote '1984'?", answer: "George Orwell"),
  Question(text: "Who wrote 'The Lord of the Rings'?", answer: "J.R.R. Tolkien"),
  Question(text: "Who wrote 'To Kill a Mockingbird'?", answer: "Harper Lee"),
  Question(text: "Who wrote 'The Catcher in the Rye'?", answer: "J.D. Salinger"),
  Question(text: "Who wrote 'The Hobbit'?", answer: "J.R.R. Tolkien"),
  Question(text: "Who wrote 'Brave New World'?", answer: "Aldous Huxley"),
  Question(text: "Who wrote 'The Chronicles of Narnia'?", answer: "C.S. Lewis"),
  
  // Music
  Question(text: "Who is known as the King of Pop?", answer: "Michael Jackson"),
  Question(text: "How many strings does a guitar have?", answer: "6"),
  Question(text: "Who wrote the song 'Imagine'?", answer: "John Lennon"),
  Question(text: "What year did Elvis Presley die?", answer: "1977"),
  Question(text: "Who is known as the Queen of Pop?", answer: "Madonna"),
  Question(text: "How many keys does a piano have?", answer: "88"),
  Question(text: "Who wrote the song 'Bohemian Rhapsody'?", answer: "Queen"),
  Question(text: "What year did The Beatles break up?", answer: "1970"),
  Question(text: "Who is known as the King of Rock?", answer: "Elvis Presley"),
  Question(text: "How many notes are in an octave?", answer: "8"),
  
  // Food & Drink
  Question(text: "What is the main ingredient in guacamole?", answer: "Avocado"),
  Question(text: "What is the national dish of Italy?", answer: "Pizza"),
  Question(text: "What is the most consumed beverage in the world?", answer: "Tea"),
  Question(text: "What is the main ingredient in sushi?", answer: "Rice"),
  Question(text: "What is the national dish of Japan?", answer: "Sushi"),
  Question(text: "What is the most consumed meat in the world?", answer: "Pork"),
  Question(text: "What is the main ingredient in hummus?", answer: "Chickpeas"),
  Question(text: "What is the national dish of Mexico?", answer: "Tacos"),
  Question(text: "What is the most consumed fruit in the world?", answer: "Tomato"),
  Question(text: "What is the main ingredient in curry?", answer: "Turmeric"),
  
  // Animals
  Question(text: "What is the fastest land animal?", answer: "Cheetah"),
  Question(text: "What is the largest mammal in the world?", answer: "Blue Whale"),
  Question(text: "What is the national animal of China?", answer: "Giant Panda"),
  Question(text: "What is the smallest mammal in the world?", answer: "Bumblebee Bat"),
  Question(text: "What is the national animal of India?", answer: "Bengal Tiger"),
  Question(text: "What is the most venomous snake?", answer: "Inland Taipan"),
  Question(text: "What is the national animal of Australia?", answer: "Kangaroo"),
  Question(text: "What is the largest bird in the world?", answer: "Ostrich"),
  Question(text: "What is the national animal of Canada?", answer: "Beaver"),
  Question(text: "What is the most intelligent animal?", answer: "Dolphin"),
  
  // Art
  Question(text: "Who painted the Sistine Chapel ceiling?", answer: "Michelangelo"),
  Question(text: "Who painted 'The Starry Night'?", answer: "Vincent van Gogh"),
  Question(text: "Who painted 'The Last Supper'?", answer: "Leonardo da Vinci"),
  Question(text: "Who painted 'The Scream'?", answer: "Edvard Munch"),
  Question(text: "Who painted 'Guernica'?", answer: "Pablo Picasso"),
  Question(text: "Who painted 'The Persistence of Memory'?", answer: "Salvador Dalí"),
  Question(text: "Who painted 'Girl with a Pearl Earring'?", answer: "Johannes Vermeer"),
  Question(text: "Who painted 'The Birth of Venus'?", answer: "Sandro Botticelli"),
  Question(text: "Who painted 'American Gothic'?", answer: "Grant Wood"),
  Question(text: "Who painted 'The Night Watch'?", answer: "Rembrandt"),
  
  // General Knowledge
  Question(text: "What is the capital of France?", answer: "Paris"),
  Question(text: "What is the largest country in the world?", answer: "Russia"),
  Question(text: "What is the most spoken language in the world?", answer: "Mandarin Chinese"),
  Question(text: "What is the currency of Japan?", answer: "Yen"),
  Question(text: "What is the capital of Italy?", answer: "Rome"),
  Question(text: "What is the largest island in the world?", answer: "Greenland"),
  Question(text: "What is the most populous country in the world?", answer: "China"),
  Question(text: "What is the currency of the United Kingdom?", answer: "Pound"),
  Question(text: "What is the capital of Spain?", answer: "Madrid"),
  Question(text: "What is the most visited country in the world?", answer: "France"),
  
  // Science (Additional)
  Question(text: "What is the chemical symbol for iron?", answer: "Fe"),
  Question(text: "What is the largest bone in the human body?", answer: "Femur"),
  Question(text: "What is the chemical symbol for oxygen?", answer: "O"),
  Question(text: "What is the smallest planet in our solar system?", answer: "Mercury"),
  Question(text: "What is the chemical symbol for sodium?", answer: "Na"),
  Question(text: "What is the most abundant gas in Earth's atmosphere?", answer: "Nitrogen"),
  Question(text: "What is the chemical symbol for lead?", answer: "Pb"),
  Question(text: "What is the largest organ inside the human body?", answer: "Liver"),
  Question(text: "What is the chemical symbol for copper?", answer: "Cu"),
  Question(text: "What is the closest planet to the Sun?", answer: "Mercury"),
  
  // History (Additional)
  Question(text: "Who was the first woman to fly solo across the Atlantic?", answer: "Amelia Earhart"),
  Question(text: "In which year did the first World War end?", answer: "1918"),
  Question(text: "Who was the first person to reach the South Pole?", answer: "Roald Amundsen"),
  Question(text: "What year did the first computer mouse patent?", answer: "1970"),
  Question(text: "Who was the first person to reach the North Pole?", answer: "Robert Peary"),
  Question(text: "In which year did the first email sent?", answer: "1971"),
  Question(text: "Who was the first person to climb Mount Everest?", answer: "Edmund Hillary"),
  Question(text: "What year did the first mobile phone call?", answer: "1973"),
  Question(text: "Who was the first person to orbit Earth?", answer: "Yuri Gagarin"),
  Question(text: "In which year did the first website go live?", answer: "1991"),
  
  // Technology (Additional)
  Question(text: "What does PDF stand for?", answer: "Portable Document Format"),
  Question(text: "What does GPS stand for?", answer: "Global Positioning System"),
  Question(text: "What does USB stand for?", answer: "Universal Serial Bus"),
  Question(text: "What does DNA stand for?", answer: "Deoxyribonucleic Acid"),
  Question(text: "What does NASA stand for?", answer: "National Aeronautics and Space Administration"),
  Question(text: "What does DVD stand for?", answer: "Digital Versatile Disc"),
  Question(text: "What does LED stand for?", answer: "Light Emitting Diode"),
  Question(text: "What does CPU stand for?", answer: "Central Processing Unit"),
  Question(text: "What does LCD stand for?", answer: "Liquid Crystal Display"),
  Question(text: "What does RAM stand for?", answer: "Random Access Memory"),
]; 