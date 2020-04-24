# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require "pry"
class Photo
    attr_accessor :user
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def make_comment(comment)
        Comment.new(comment, self)
    end

    def comments
        Comment.all.select {|comment| comment.photo == self}
    end
end

class Comment
    @@all = []
    attr_reader :comment, :photo

    def initialize(comment, photo)
        @photo = photo
        @comment = comment
        @@all << self
    end

    def self.all
        @@all
    end
end

class User
    attr_reader :name

    def initialize(name)
        @name = name
    end
    
    def photos
        Photo.all.select {|photo| photo.user == self}
    end
end

puts sandwich_photo = Photo.new
puts sophie = User.new("Sophie")
puts sandwich_photo.user = sophie
puts sandwich_photo.user.name
# => "Sophie"
puts sophie.photos
# => [#<Photo:0x00007fae2880b370>]


puts sandwich_photo.comments
# => []
binding.pry

puts sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
puts sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

puts Comment.all
#=> [#<Comment:0x00007fae28043700>]
