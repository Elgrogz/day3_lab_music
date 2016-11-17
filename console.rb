require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')
require_relative('models/songs')

# Song.delete_all
# Album.delete_all
# Artist.delete_all

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
  'title' => 'Blood Sugar Sex Magic',
  'genre' => 'Funk',
  'artist_id' => artist2.id
  })

album1.save()
album2.save()

song1 = Song.new({
  'song_title' => 'Highway to Hell',
  'artist_id' => artist1.id,
  'album_id' => album1.id
  })

song2 = Song.new({
  'song_title' => 'Give It Away',
  'artist_id' => artist2.id,
  'album_id' => album2.id
  })

song1.save
song2.save

binding.pry
nil




#extension artist ---> album (one to many)

#maybe add songs to albums, add a function to count albums, songs, price of albums