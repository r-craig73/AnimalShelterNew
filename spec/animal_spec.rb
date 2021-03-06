require("spec_helper")
require("rspec")
require('pg')
require('pry')
require('animal')

describe(Animal) do
    describe(".all") do
        it("is empty at first") do
          expect(Animal.all()).to(eq([]))
        end
      end

      describe("#save") do
        it("adds animal information to the array of saved tasks") do
          animal1 = Animal.new({:animal_name => "Lassie", :animal_gender => "Female", :animal_type => "dog", :animal_id => 70, :admit_date => "2018-01-16 00:00:00", :breed => "mixed", :id => nil})
          animal1.save
          #binding.pry
          expect(Animal.all()).to(eq([animal1]))
        end
      end

      describe('.find') do
          it("returns a pet by its ID number") do
            first_animal = Animal.new({:animal_name => 'Buster', :animal_gender => 'male', :animal_type => 'dog', :admit_date => '2017-08-08 00:00:00', :animal_id => 14, :breed => 'beagle', :id => nil})
            first_animal.save
            second_animal = Animal.new({:animal_name => 'Chucky', :animal_gender => 'male', :animal_type => 'dog', :admit_date => '2017-08-12 00:00:00', :animal_id => 17, :breed => 'beagle', :id => nil})
            second_animal.save
            expect(Animal.find(second_animal.id())).to(eq(second_animal))
        end
      end

      describe('#==') do
          it('is the same animal if names and ids are the same') do
            one = Animal.new({:animal_name => 'Scrappy', :animal_gender => 'female', :animal_type => 'dog', :animal_id => 9, :admit_date => '2018-05-01', :breed => 'mixed', :id => nil})
            two = Animal.new({:animal_name => 'Scrappy', :animal_gender => 'female', :animal_type => 'dog', :animal_id => 9, :admit_date => '2018-05-01', :breed => 'mixed', :id => nil})
            expect(one).to(eq(two))
          end
        end # ==
end
