User.destroy_all
Bottle.destroy_all
Review.destroy_all
Cellar.destroy_all
Stash.destroy_all

u1 = User.create(username: "Jakarai", password: "Jakarai", hint: "Try your name")
u2 = User.create(username: "Griffin", password: "Griffin", hint: "Me")

b1 = Bottle.create(brand: "Barefoot",wine_type: "Rose",color: "Pink", year: 500, image: "BareFootC_Rose.png")
b2 = Bottle.create(brand: "Dark Horse", wine_type: "Rose" ,color: "Pink" ,year: 1998, image: "darkhorse_rose.png")
b3 = Bottle.create(brand: "Kim Crawford", wine_type: "Sauvignon Blanc" ,color: "White" ,year: 1950, image: "kim_crawford.png")
b4 = Bottle.create(brand: "Sineanne", wine_type: "Pinot Gris" ,color: "White" ,year: 1000, image: "s_p_w.png" )
b5 = Bottle.create(brand: "Husch Anderson Valley" , wine_type: "Pinot Noir",color: "Red" ,year: 607, image: "husch_p_r.png")
b6 = Bottle.create(brand: "Chateau Montelena Napa Valley", wine_type: "Cabernet Sauvignon" ,color: "Red" ,year: 1780, image: "Chateau-Montelena-Cabernet-Sauvignon.png")
b7 = Bottle.create(brand: "Veuve Clicquot", wine_type: "Champagne" ,color: "Yellow" ,year: 2010, image: "veuve-clicqout.png" )
b8 = Bottle.create(brand: "Dom Perignon", wine_type: "Champagne",color: "Yellow",year: 1508, image: "Dom_c_y.png")
b9 = Bottle.create(brand: "TY KU", wine_type: "Sake",color: "Black",year: 1770, image: "tyku_s_b.png" )
b10 = Bottle.create(brand: "Santa Margherita", wine_type: "Pinot Grigio",color: "White",year: 1860, image: "santa-margherita_p_w.png")

r1 = Review.create(content: "very good, will buy again", rating: 5, bottle_id: b5.id, user_id: u2.id)
r2 = Review.create(content: "very good, will buy again", rating: 5, bottle_id: b7.id, user_id: u1.id)
c1 = Cellar.create(user_id: u2.id, name: "After Party",description: "cool for a party.",)
c2 = Cellar.create(user_id: u1.id, name: "For a Ball",description: "Great for a ball.",)
c3 = Cellar.create(user_id: u2.id, name: "Gallery Night",description: "Best for a gallery night.",)
c4 = Cellar.create(user_id: u1.id, name: "Graduation",description: "Works wonders for graduation.",)
c5 = Cellar.create(user_id: u2.id, name: "Stressed",description: "Eases you when stressed.",)
c6 = Cellar.create(user_id: u1.id, name: "Birthday",description: "Must have for your birthday.",)
c7 = Cellar.create(user_id: u2.id, name: "Christmas special",description: "Fantastic for a Christmas special.",)
c8 = Cellar.create(user_id: u1.id, name: "New Year Baby",description: "Perfect for going to straight from Dec 31st to Jan 2nd.",)


s1 = Stash.create(bottle_id: b6.id, cellar_id: c3.id)
s2 = Stash.create(bottle_id: b4.id, cellar_id: c2.id)
arr = ["xchghfdzsadzxc, dfghkjghfgtrshch", "sdxfccmjhggf64e5rt", "Dzfvbnklkfy765", "sghkjhgesx", "xcmnfdxgzsfgdhhgSDfbx"]
100.times do
    Review.create(content: arr.sample, rating: (1..5).to_a.sample, bottle_id: Bottle.all.sample.id, user_id: User.all.sample.id)
end

100.times do
    Stash.create(bottle_id: Bottle.all.sample.id, cellar_id: Cellar.all.sample.id)
end
