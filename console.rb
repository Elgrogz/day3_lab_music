require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')

Artist.delete_all

artist1 = Artist.new({
  'name' => 'ACDC',
  'nationality' => 'Scotland mainly'
  })

artist2 = Artist.new({
  'name' => 'Red Hot Chili Peppers',
  'nationality' => 'American'
  })

artist1.save
artist2.save

binding.pry
nil