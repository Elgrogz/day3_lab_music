require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({
  'name' => 'ACDC',
  'nationality' => 'Scotland mainly'
  })

artist2 = Artist.new({
  'name' => 'Red Hot Chili Peppers',
  'nationality' => 'American'
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'back in black',
  'genre' => 'rock',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'live in Rio',
  'genre' => 'rock',
  'artist_id' => artist2.id
  })



album1.save()
album2.save()


# artist2.name = 'Nirvana'
# artist2.update

binding.pry
nil


#extension artist ---> album (one to many)

#maybe add songs to albums, add a function to count albums, songs, price of albums