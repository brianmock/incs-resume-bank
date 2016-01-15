sources = [
  "Flyer",
  "INCS Website",
  "INCS Email",
  "INCS Twitter, Facebook or LinkedIn",
  "Friend or Colleague",
  "Idealist",
  "Indeed",
  "Austin Weekly",
  "Wednesday Journal",
  "NPO",
  "DNA Info",
  "College jobs board, newsletter or staff"
]

sources.each do |source|
  Source.create(source_name: source)
end