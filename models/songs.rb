require('pg')
require('pry-byebug')
require_relative('../db/sql_runner')

class Song

  attr_accessor :song_title, :artist_id, :album_id
  attr_reader :id

  def initialize(options)
    @song_title = options['song_title']
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO songs (song_title, artist_id, album_id) VALUES ('#{@song_title}', #{@artist_id}, #{@album_id}) returning * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete
    sql = "DELETE FROM songs WHERE id = (#{@id});"
    result = SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE songs SET (song_title) = ('#{@song_title}') WHERE id = (#{@id});"
    result = SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM (songs);"
    results = SqlRunner.run(sql)
    return results.map {|hash| Song.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM songs;"
    results = SqlRunner.run(sql)
    return results.map {|hash| Song.new(hash)}
  end

  def songs
    sql = "SELECT FROM songs WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    return Artist.new(result[0])
  end
end