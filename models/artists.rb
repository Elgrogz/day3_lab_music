require('pg')
require('pry-byebug')
require_relative('../db/sql_runner')

class Artist
  attr_accessor :name, :nationality
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @nationality = options['nationality']
    @id = options['id'].to_i if options['id'] 
  end

  def save()
    sql = "INSERT INTO artists (name, nationality) VALUES ('#{@name}', '#{@nationality}') returning *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete
    return unless @id
    sql = "DELETE FROM artists WHERE id = (#{@id})"
    result = SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = (#{@id})"
    result = SqlRunner.run(sql)
  end


  def self.delete_all
    sql = "DELETE FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end
 
  def album
    sql = "SELECT * FROM albums WHERE artist_id = (#{@id});"
    result = SqlRunner.run(sql)
    return albums = result.map{|album| Album.new(album)}
  end

  def song_by_artist
    sql = "SELECT * FROM albums SONG artist_id = (#{@id});"
    result = SqlRunner.run(sql)
    return songs = result.map {|song| Song.new(song)}
  end

end