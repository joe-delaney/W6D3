# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# dropping tables
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all
Like.destroy_all
Collection.destroy_all

u1 = User.create(username: 'Luke')
u2 = User.create(username: 'Leiah')
u3 = User.create(username: 'Yoda')


artwork1 = Artwork.create(title: '5AM', image_url: 'https://ctl.s6img.com/society6/img/aMA6Lc2wS_uPkEhwbIsp4Ztue5U/w_1500/prints/~artwork/s6-0085/a/33323662_1741286/~~/5am-t1h-prints.jpg', artist_id: u1.id, favorite:true)
artwork4 = Artwork.create(title: '6AM', image_url: 'https://ctl.s6img.com/society6/img/aMA6Lc2wS_uPkEhwbIsp4Ztue5U/w_1500/prints/~artwork/s6-0085/a/33323662_1741286/~~/5am-t1h-prints.jpg', artist_id: u1.id, favorite:true)
artwork2 = Artwork.create(title: 'Coffee Time', image_url: 'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/coffee-time-rita-polizzi.jpg', artist_id: u2.id, favorite: true)
artwork3 = Artwork.create(title: 'Mona Lisa', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', artist_id: u2.id)
artwork5 = Artwork.create(title: 'Moona Lisa', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', artist_id: u3.id)
artwork6 = Artwork.create(title: 'Momma Lisa', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', artist_id: u3.id)
artwork7 = Artwork.create(title: 'Mona Linda', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', artist_id: u3.id)

artwork_share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: u2.id, favorite: true)
artwork_share2 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: u3.id, favorite: true)
artwork_share3 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: u1.id, favorite: true)
artwork_share4 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: u3.id)
artwork_share5 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: u1.id)

c1 = Comment.create(body: "may the force be with you", artwork_id: artwork1.id, user_id: u2.id)
c2 = Comment.create(body: "This is Yoda", artwork_id: artwork2.id, user_id: u3.id)
c3 = Comment.create(body: "come to the dark side", artwork_id: artwork1.id, user_id: u3.id)
c4 = Comment.create(body: "Where's my gf @", artwork_id: artwork3.id, user_id: u1.id)

l1 = Like.create(liker_id: u1.id, likable: artwork2)
l2 = Like.create(liker_id: u2.id, likable: artwork1)
l3 = Like.create(liker_id: u3.id, likable: artwork3)
l4 = Like.create(liker_id: u3.id, likable: artwork1)
l5 = Like.create(liker_id: u3.id, likable: c1)
l6 = Like.create(liker_id: u2.id, likable: c2)
l7 = Like.create(liker_id: u3.id, likable: c4)
l8 = Like.create(liker_id: u1.id, likable: c3)

collection1 = Collection.create(name: 'cool_pics', collector_id: u1.id, artwork_id: artwork1.id)
collection2 = Collection.create(name: 'cool_pics', collector_id: u1.id, artwork_id: artwork4.id)
collection3 = Collection.create(name: 'uncool_pics', collector_id: u2.id, artwork_id: artwork2.id)
collection4 = Collection.create(name: 'uncool_pics', collector_id: u2.id, artwork_id: artwork3.id)
collection5 = Collection.create(name: 'just_pics', collector_id: u3.id, artwork_id: artwork5.id)
collection6 = Collection.create(name: 'just_pics', collector_id: u3.id, artwork_id: artwork6.id)
collection7 = Collection.create(name: 'just_pics', collector_id: u3.id, artwork_id: artwork7.id)
collection8 = Collection.create(name: 'new_pics', collector_id: u1.id, artwork_id: artwork1.id)