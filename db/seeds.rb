class Seed
    def self.begin(count = 20)
        puts ''
        puts 'Seeds:'
        e
        generate_animals(count)
    end

    private
    def self.e
        Review.destroy_all
    end

    def self.generate_animals(count)
        count.times do |i|
            animal = Animal.create!(
                name: Faker::Creature::Cat.name,
                breed: Faker::Creature::Cat.breed,
                age: Faker::Number.between(from: 1, to: 14)
            )
        end
        count.times do |i|
            animal = Animal.create!(
                name: Faker::Creature::Dog.name,
                breed: Faker::Creature::Dog.breed,
                age: Faker::Number.between(from: 1, to: 14)
            )
        end
        puts "  Created #{Animal.count} cats and #{Animal.count} dogs."
    end
end

Seed.begin
