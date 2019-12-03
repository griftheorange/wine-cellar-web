User.destroy_all
Bottle.destroy_all
Review.destroy_all
Cellar.destroy_all
Stash.destroy_all

u1 = User.create(username: "Jakarai", password: "Jakarai",)
u2 = User.create(username: "Griffin", password: "Griffin",)

b1 = Bottle.create(brand: "Barefoot",wine_type: "Rose",color: "Pink", year: 5)
b2 = Bottle.create(brand: "Dark Horse", wine_type: "Rose" ,color: "Pink" ,year: 3)
b3 = Bottle.create(brand: "Kim Crawford", wine_type: "Sauvignon Blanc" ,color: "White" ,year: 12)
b4 = Bottle.create(brand: "Sineanne", wine_type: "Pinot Gris" ,color: "White" ,year: 10 )
b5 = Bottle.create(brand: "Husch Anderson Valley" , wine_type: "Pinot Noir",color: "Red" ,year: 6)
b6 = Bottle.create(brand: "Chateau Montelena Napa Valley", wine_type: "Cabernet Sauvignon" ,color: "Red" ,year: 7)
b7 = Bottle.create(brand: "Veuve Clicquot", wine_type: "Champagne" ,color: "Yellow" ,year: 20 )
b8 = Bottle.create(brand: "Dom Perignon", wine_type: "Champagne",color: "Yellow",year: 15)
b9 = Bottle.create(brand: "TY KU", wine_type: "Sake",color: "Black",year: 7 )
b10 = Bottle.create(brand: "Santa Margherita", wine_type: "Pinot Grigio",color: "White",year: 6)

r1 = Review.create(content: "very good, will buy again", rating: 5, bottle_id: b5.id, user_id: u2.id)
r2 = Review.create(content: "very good, will buy again", rating: 5, bottle_id: b7.id, user_id: u1.id)
c1 = Cellar.create(user_id: u2.id, name: "Fav",description: "cool",)
c2 = Cellar.create(user_id: u1.id, name: "Worst",description: "bad",)
c3 = Cellar.create(user_id: u2.id, name: "idk",description: "eehh",)
c4 = Cellar.create(user_id: u1.id, name: "yes",description: "yum",)



s1 = Stash.create(bottle_id: b6.id, cellar_id: c3.id)
s2 = Stash.create(bottle_id: b4.id, cellar_id: c2.id)
