User.destroy_all
Bottle.destroy_all
Review.destroy_all
Cellar.destroy_all
Stash.destroy_all

u1 = User.create(username: "Jakarai", password: "Jakarai",)
u2 = User.create(username: "Griffin", password: "Griffin",)

b1 = Bottle.create(brand: "Barefoot",wine_type: "Rose",color: "Pink", year: 500, image: "BareFootC_Rose.png")
b2 = Bottle.create(brand: "Dark Horse", wine_type: "Rose" ,color: "Pink" ,year: 1998, image: "")
b3 = Bottle.create(brand: "Kim Crawford", wine_type: "Sauvignon Blanc" ,color: "White" ,year: 1950, image: "")
b4 = Bottle.create(brand: "Sineanne", wine_type: "Pinot Gris" ,color: "White" ,year: 1000, image: "" )
b5 = Bottle.create(brand: "Husch Anderson Valley" , wine_type: "Pinot Noir",color: "Red" ,year: 607, image: "")
b6 = Bottle.create(brand: "Chateau Montelena Napa Valley", wine_type: "Cabernet Sauvignon" ,color: "Red" ,year: 1780, image: "")
b7 = Bottle.create(brand: "Veuve Clicquot", wine_type: "Champagne" ,color: "Yellow" ,year: 2010, image: "" )
b8 = Bottle.create(brand: "Dom Perignon", wine_type: "Champagne",color: "Yellow",year: 1508, image: "")
b9 = Bottle.create(brand: "TY KU", wine_type: "Sake",color: "Black",year: 1770, image: "" )
b10 = Bottle.create(brand: "Santa Margherita", wine_type: "Pinot Grigio",color: "White",year: 1860, image: "")

r1 = Review.create(content: "very good, will buy again", rating: 5, bottle_id: b5.id, user_id: u2.id)
r2 = Review.create(content: "very good, will buy again", rating: 5, bottle_id: b7.id, user_id: u1.id)
c1 = Cellar.create(user_id: u2.id, name: "Fav",description: "cool",)
c2 = Cellar.create(user_id: u1.id, name: "Worst",description: "bad",)
c3 = Cellar.create(user_id: u2.id, name: "idk",description: "eehh",)
c4 = Cellar.create(user_id: u1.id, name: "yes",description: "yum",)
c5 = Cellar.create(user_id: u2.id, name: "Me",description: "cool",)
c6 = Cellar.create(user_id: u1.id, name: "You",description: "bad",)
c7 = Cellar.create(user_id: u2.id, name: "Party Time",description: "eehh",)
c8 = Cellar.create(user_id: u1.id, name: "Yeet Sqwad",description: "yum",)


s1 = Stash.create(bottle_id: b6.id, cellar_id: c3.id)
s2 = Stash.create(bottle_id: b4.id, cellar_id: c2.id)
arr = ["xchghfdzsadzxc, dfghkjghfgtrshch", "sdxfccmjhggf64e5rt", "Dzfvbnklkfy765", "sghkjhgesx", "xcmnfdxgzsfgdhhgSDfbx"]
100.times do
    Review.create(content: arr.sample, rating: (1..5).to_a.sample, bottle_id: Bottle.all.sample.id, user_id: User.all.sample.id)
end

100.times do
    Stash.create(bottle_id: Bottle.all.sample.id, cellar_id: Cellar.all.sample.id)
end
