require_relative 'lib/database_connection'
require_relative 'lib/album_repository'


DatabaseConnection.connect('music_library')

result = DatabaseConnection.exec_params('SELECT * FROM albums;', [])

repo = AlbumRepository.new 
album = repo.find(1)

p album.title
p album.release_year

