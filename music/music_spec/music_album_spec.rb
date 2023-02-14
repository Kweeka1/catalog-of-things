require_relative '../music_album.rb'

describe MusicAlbum do 
    context "Testing for music_album class" do 
       
       it "Should return value in music_album class" do 
          music = MusicAlbum.new
          expect(music.music).to be_empty
          expect(music.genres).to be_empty
          expect(music.list_music).to eq nil
          expect(music.list_genre).to eq nil
       end     
    end
 end