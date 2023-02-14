require_relative '../genre.rb'

describe Genre do 
    context "Testing for genre class" do 
       
       it "Should return id and name value in genre class" do 
          genre = Genre.new("comedy")
          expect(genre.name).to eq "comedy"
          expect(genre.id).to be_between(0, 10_000).exclusive
       end
        
       it "Should return id and name value in genre class" do 
        genre = Genre.new("horror")
        expect(genre.name).to eq "horror"
        expect(genre.id).to be_between(0, 10_000).exclusive
       end
       
    end
 end