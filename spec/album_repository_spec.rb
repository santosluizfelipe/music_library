require 'album'
require 'album_repository'

RSpec.describe 'AlbumRepository' do 

  def reset_albums_table
    user = 'postgres'
    password = ENV['050498'].to_s
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test', user: user, password: password  })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_albums_table
  end

  xit 'returns two albums' do 
    repo = AlbumRepository.new
    albums = repo.all

  expect(albums.length).to eq 2
  expect(albums.first.title).to eq 'Bossanova'
  expect(albums.first.release_year).to eq '1999'
  expect(albums.first.artist_id).to eq '1'
  end

  it 'returns 1 record' do 
    repo = AlbumRepository.new
    albums = repo.find(1)
    expect(albums.title).to eq 'Bossanova'
  end
end