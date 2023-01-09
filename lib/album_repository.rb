require_relative './album'
require 'pg'


class AlbumRepository
  def initialize
    @conn = PG.connect(
      host: '127.0.0.1',
      user: 'postgres',
      password: '050498',
      dbname: 'music_library_test'
    )
  end
  def all
    albums = []

    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = @conn.exec(sql)

    result_set.each do |record|
      album = Album.new 

      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id =  record['artist_id']

      albums << album
    end

    albums
  end

  def find(id)
    sql = 'SELECT * FROM albums WHERE id = $1'
    sql_params = [id]
    result_set = @conn.exec(sql, sql_params)
    record = result_set[0]

    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id =  record['artist_id']

    album
  end
end